using Databaser_Labb3.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Databaser_Labb3
{
    internal static class GradesMenu
    {
        internal static void GradesMenuOptions()
        {
            var context = new SchoolDbContext();
            while (true)
            {
                Console.WriteLine("What would you like to do with the personel data?");
                Console.WriteLine("1. Show all grades\n" +
                                    "2. Add grade\n" +
                                    "3. Return to main menu");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 6)
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

        private static void AddGrade(SchoolDbContext context)
        {


        }

    }
}
