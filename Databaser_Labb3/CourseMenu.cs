using Databaser_Labb3.Data;
using Databaser_Labb3.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Databaser_Labb3
{
    internal static class CourseMenu
    {
        public static void CourseMenuOptions()
        {
            var context = new SchoolDbContext();
            while (true)
            {
                Console.WriteLine("What would you like to do with the course data?");
                Console.WriteLine("1. All Courses\n" +
                                    "2. All active courses\n" +
                                    "3. Return to main menu");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 3)
                {
                    switch (input)
                    {
                        case 1:
                            ShowCourses(context);
                            break;

                        case 2:
                            ShowActiveCourses(context);
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

        private static void ShowCourses(SchoolDbContext context)
        {
            var allCourse = context.Courses.ToList();
            foreach (var course in allCourse)
            {
                Console.WriteLine($"Course Id: {course.Id}| Course name: {course.CourseName}");
            }
        }
        private static void ShowActiveCourses(SchoolDbContext context)
        {
            var activeCourses = context.Courses.Where(c => c.).ToList();
        }
    }
}
