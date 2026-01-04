using Databaser_Labb3.Data;
using Databaser_Labb3.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Databaser_Labb3
{
    internal static class GradesMenu
    {
        internal static void GradesMenuOptions()
        {
            var context = new SchoolDbContext();
            while (true)
            {
                Console.WriteLine("What would you like to do with the grade data?");
                Console.WriteLine("1. Show all grades\n" +
                                    "2. Add grade\n" +
                                    "3. Return to main menu");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 3)
                {
                    switch (input)
                    {
                        case 1:
                            ShowGrades(context);
                            break;

                        case 2:
                            AddGrade(context);
                            break;

                        case 3:
                            return;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input.");
                }
            }
        }
        private static void ShowGrades(SchoolDbContext context)
        {
            var allGrades = context.Grades
                            .Include(g => g.Student)
                            .Include(g => g.Course)
                            .Include(g => g.Grade1Navigation)
                            .ToList();

            foreach (var grade in allGrades)
            {
                Console.WriteLine($"Name:{grade.Student.FirstName} {grade.Student.LastName} | Course: {grade.Course.CourseName} | Grade: {grade.Grade1Navigation.GradeName}");
            }
        }

        // Adding grades with transaction to handle errors.
        private static async Task AddGrade(SchoolDbContext context)
        {
            // Create variables to hold chosen options
            Personel? chosenTeacher = null;
            Student? chosenStudent = null;
            Course? chosenCourse = null;
            GradeInfo? chosenGrade = null;

            // Decide which teacher is grading
            var listOfTeachers = context.Personels.Where(p => p.VocationId == 1).ToList();
            int index = 0;
            Console.WriteLine("Which teacher is making this grade?");
            foreach (var teacher in listOfTeachers)
            {
                Console.WriteLine($"{index+1}. {teacher.FirstName} {teacher.LastName}");
                index++;
            }
            Console.WriteLine();
            if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= listOfTeachers.Count())
            {
                chosenTeacher = listOfTeachers[input - 1];
                Console.WriteLine($"Yes! - Chosen teacher: {chosenTeacher.Id} {chosenTeacher.FirstName} {chosenTeacher.LastName}");
            }
            else
            {
                Console.WriteLine("Invalid option. Aborting process.");
                return;
            }

            // Decide which student is getting a grade
            var listOfStudents = context.Students.Include(s => s.Class).ToList();
            index = 0;
            Console.WriteLine("Which student is getting graded?");
            foreach (var student in listOfStudents)
            {
                Console.WriteLine($"{index + 1}. {student.FirstName} {student.LastName} | {student.Class.ClassName}");
                index++;
            }
            Console.WriteLine();
            if (int.TryParse(Console.ReadLine(), out int inputStudent) && inputStudent >= 1 && inputStudent <= listOfStudents.Count())
            {
                chosenStudent = listOfStudents[inputStudent - 1];
                Console.WriteLine("Yes 2!");
            }
            else
            {
                Console.WriteLine("Invalid option. Aborting process.");
                return;
            }

            // Pick which course is getting graded
            var listOfCourses = context.Courses.ToList();
            index = 0;
            Console.WriteLine("Which course is the student getting graded on?");
            foreach (var course in listOfCourses)
            {
                Console.WriteLine($"{index + 1}. {course.CourseName}");
                index++;
            }
            Console.WriteLine();
            if (int.TryParse(Console.ReadLine(), out int inputCourse) && inputCourse >= 1 && inputCourse <= listOfCourses.Count())
            {
                chosenCourse = listOfCourses[inputCourse - 1];
                Console.WriteLine("Yes 3!");
            }
            else
            {
                Console.WriteLine("Invalid option. Aborting process.");
                return;
            }

            // Pick which grade the student gets on the course
            var listOfGrades = context.GradeInfos.ToList();
            index = 0;
            Console.WriteLine("Which course is the student getting graded on?");
            foreach (var grade in listOfGrades)
            {
                Console.WriteLine($"{index + 1}. {grade.GradeName}");
                index++;
            }
            Console.WriteLine();
            if (int.TryParse(Console.ReadLine(), out int inputGrade) && inputGrade >= 1 && inputGrade <= listOfGrades.Count())
            {
                chosenGrade = listOfGrades[inputGrade - 1];
                Console.WriteLine("Yes 4!");
            }
            else
            {
                Console.WriteLine("Invalid option. Aborting process.");
                return;
            }
            
            using var transaction = context.Database.BeginTransaction();
            try
            {
                // Add new grade with chosen info
                Console.WriteLine($"Does this look correct?");
                Console.WriteLine($"Teacher: {chosenTeacher.FirstName} {chosenTeacher.LastName}\n" +
                                    $"Student: {chosenStudent.FirstName} {chosenStudent.LastName} - {context.Classes.Where(c => c.Id == chosenStudent.ClassId).Select(c => c.ClassName).FirstOrDefault()}\n" +
                                    $"Course: {chosenCourse.CourseName}\n" +
                                    $"Grade: {chosenGrade.GradeName}");
                Console.WriteLine($"1. Yes\n" +
                                    "2. No");
                if(int.TryParse(Console.ReadLine(), out int inputFinal) && inputFinal == 1)
                {
                    Console.WriteLine("Creating new grade.");
                    context.Grades.Add(new Grade
                    {
                        TeacherId = chosenTeacher.Id,
                        StudentId = chosenStudent.Id,
                        CourseId = chosenCourse.Id,
                        Grade1 = chosenGrade.Id,
                        DateAssigned = DateOnly.FromDateTime(DateTime.Now)
                    });
                    context.SaveChanges();
                }
                else
                {
                    // I know using exceptions to handle logic isn't a great idea
                    // but it was my first idea to make sure that both the try and catch worked as they should.
                    throw new Exception("Invalid final input. No new grade has been added.");
                }

                transaction.Commit();
                Console.WriteLine("Changes commited.");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                transaction.Rollback();
            }
        }
    }
}
