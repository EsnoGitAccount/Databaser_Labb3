using Databaser_Labb3.Data;
using Databaser_Labb3.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Channels;

namespace Databaser_Labb3
{
    internal static class StudentMenu
    {
        public static void StudentMenuOptions()
        {
            var context = new SchoolDbContext();
            while(true)
            {           
                Console.WriteLine("What would you like to do with the student data?");
                Console.WriteLine("1. Show all students\n" +
                                    "2. Show all students and their grades\n" +
                                    "3. Show students ordered by class\n" +
                                    "4. Add Student\n" +
                                    "5. Return to main menu");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 5)
                {
                    switch (input)
                    {
                        case 1:
                            ShowAllStudents(context);
                            break;

                        case 2:
                            ShowStudentsAndGrades(context);
                            break;

                        case 3:
                            ShowStudentsByClass(context);
                            break;

                        case 4:
                            AddStudent(context);
                            break;

                        case 5:
                            return;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input.");
                }
            }
        }

        private static void ShowAllStudents(SchoolDbContext context)
        {
            // Creates a place to store the query that will be used to order the students table
            IQueryable<Student> studentsQuery = context.Students;

            Console.WriteLine("Which order would you like to see the students in?:");
            Console.WriteLine("1. Default order\n" +
                              "2. Ordered by first name\n" +
                              "3. Ordered by last name\n" +
                              "4. Ordered by which class they are in");
            if (int.TryParse(Console.ReadLine(), out int input) && input < 1 && input > 4)
            {
                Console.WriteLine("Invalid input!");
                return;
            }

            Console.WriteLine("Do you want sort them in ascending or descending order?");
            Console.WriteLine("1. Ascending\n" +
                              "2. Descending");
            if (int.TryParse(Console.ReadLine(), out int input2) && input2 < 1 && input > 2)
            {
                Console.WriteLine("Invalid input!");
                return;
            }

            // Big if block that builds the query based on the user's choices.
            // I'm not super happy with this stracture because it is kinda hard to read
            // and adding more options would quickly balloon it.
            if (input == 1)
            {

                if (input2 == 1)
                {
                    studentsQuery = studentsQuery.OrderBy(student => student.Id);
                }
                else
                {
                    studentsQuery = studentsQuery.OrderByDescending(student => student.Id);
                }
            }
            else if (input == 2)
            {
                if (input2 == 1)
                {
                    studentsQuery = studentsQuery.OrderBy(student => student.FirstName);
                }
                else
                {
                    studentsQuery = studentsQuery.OrderByDescending(student => student.FirstName);
                }
            }
            else if (input == 3)
            {
                if (input2 == 1)
                {
                    studentsQuery = studentsQuery.OrderBy(student => student.LastName);
                }
                else
                {
                    studentsQuery = studentsQuery.OrderByDescending(student => student.LastName);
                }
            }
            else if (input == 4)
            {
                if (input2 == 1)
                {
                    studentsQuery = studentsQuery.OrderBy(student => student.ClassId);
                }
                else
                {
                    studentsQuery = studentsQuery.OrderByDescending(student => student.ClassId);
                }
            }

            // Because I only need the ordered list to print the student info I decide to build it straight into the foreach
            // If I needed it for more things I would save it.
            foreach (var student in studentsQuery.ToList())
            {
                Console.WriteLine($"{student.FirstName} {student.LastName}, {student.ClassId}");
            }
            Console.WriteLine();
        }

        private static void ShowStudentsAndGrades(SchoolDbContext context)
        {
            Console.WriteLine("To do!");
            var studentsAndGrades = context.Students
                                    .Include(s => s.Grades)
                                    .ThenInclude(g => g.Course)
                                    .Include(s => s.Grades)
                                    .ThenInclude(g => g.Grade1Navigation)
                                    .ToList();

            foreach(Student student in studentsAndGrades)
            {
                foreach(Grade grade in student.Grades)
                {
                    Console.WriteLine($"Name: {student.FirstName} {student.LastName} | Course: {grade.Course.CourseName} | Grade: {context.GradeInfos.FirstOrDefault(g => g.Id == grade.Grade1).GradeName}");
                }
                Console.WriteLine();
            }
        }

        private static void ShowStudentsByClass(SchoolDbContext context)
        {
            int index1 = 0;

            Console.WriteLine("Which class would you like to see the student list for?");
            foreach (var placeholderClass in context.Classes)
            {
                Console.WriteLine($"{index1 + 1}. {placeholderClass.ClassName}");
                index1++;
            }


            int.TryParse(Console.ReadLine(), out int input);
            string classAnswer = "default";

            switch (input)
            {
                case 1:
                    classAnswer = "NA2023";
                    break;

                case 2:
                    classAnswer = "NA2024";
                    break;

                case 3:
                    classAnswer = "NA2025";
                    break;

                default:
                    Console.WriteLine("Invalid class");
                    return;
                    break;
            }
            IQueryable<Student> showStudentsQuery = context.Students
                                                    .Where(s => s.Class.ClassName == classAnswer);


            Console.WriteLine("Do you want to order the students?");
            Console.WriteLine($"1. Default order\n" +
                              $"2. Order by first name\n" +
                              $"3. Order by last name");

            bool validSearchTerm = false;
            if (int.TryParse(Console.ReadLine(), out int input2) && input2 == 1)
            {
                validSearchTerm = true;
            }
            else if (input2 == 2)
            {
                showStudentsQuery = showStudentsQuery
                                .OrderBy(student => student.FirstName);
                validSearchTerm = true;
            }
            else if (input2 == 3)
            {
                showStudentsQuery = showStudentsQuery
                                .OrderBy(student => student.LastName);
                validSearchTerm = true;
            }
            else
            {
                Console.WriteLine("Invalid input.");
            }

            if (validSearchTerm == true)
            {
                var filteredStudents = showStudentsQuery.ToList();

                foreach (var student in filteredStudents)
                {
                    Console.WriteLine($"{student.FirstName} {student.LastName}, classId {student.ClassId}");
                }
            }
            Console.WriteLine();
        }

        private static void AddStudent(SchoolDbContext context)
        {
            Console.WriteLine("Enter the first name of the student:");
            string newStudentFirstName = Console.ReadLine();

            Console.WriteLine("Enter the last name of the student:");
            string newStudentLastName = Console.ReadLine();

            // Because ClassId is a foreign key I need to make sure that this property has a value that matches an existing ClassId
            // or else the program crashes.
            bool validInputClass = false;
            int newStudentClassId = 0;
            while (validInputClass == false)
            {
                Console.WriteLine("Enter the classId of the student (1000, 1001, or 1002):");
                if (int.TryParse(Console.ReadLine(), out newStudentClassId) && newStudentClassId >= 1000 && newStudentClassId <= 1002)
                {
                    validInputClass = true;
                }
                else
                {
                    Console.WriteLine("Ivalid ClassId. Enter the number 1000, 1001, or 1002.");
                }
            }

            Console.WriteLine("Enter the phonenumber of the student:");
            string newStudentPhoneNumber = Console.ReadLine();

            Console.WriteLine("Enter the phonenumber of the student's parent:");
            string newStudentParentPhoneNumber = Console.ReadLine();

            Console.WriteLine($"Do you want to add this student to the student table?(y/n) \n" +
                                $"Name: {newStudentFirstName} {newStudentLastName}\n" +
                                $"ClassId: {newStudentClassId}\n" +
                                $"Phonenumber: {newStudentPhoneNumber}\n" +
                                $"Parent Phonenumber: {newStudentParentPhoneNumber}\n");

            string yesNo = Console.ReadLine();
            if (yesNo == "y")
            {
                context.Students.Add(new Student
                {
                    FirstName = newStudentFirstName,
                    LastName = newStudentLastName,
                    ClassId = newStudentClassId,
                    PhoneNumber = newStudentPhoneNumber,
                    ParentPhoneNumber = newStudentParentPhoneNumber
                });

                context.SaveChanges();
            }
            else
            {
                Console.WriteLine("Didn't add student.");
            }
        }
    }
}
