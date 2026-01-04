using Databaser_Labb3.Data;
using Microsoft.EntityFrameworkCore;
using System.Threading.Channels;
using System.Linq;
using Databaser_Labb3.Models;

namespace Databaser_Labb3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Instanciate the DbContext in main so that I can feed it into all the methods
            // instead of creating a new instance in each method
            SchoolDbContext context = new SchoolDbContext();

            bool mainLoop = true;
            while (mainLoop)
            {
                Console.WriteLine("Which data would you like to access?");
                Console.WriteLine("1. Students\n" +
                                    "2. Personel\n" +
                                    "3. Courses\n" +
                                    "4. Grades\n" +
                                    "5. Quit");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 5)
                {
                    switch (input)
                    {
                        case 1:
                            StudentMenu.StudentMenuOptions();
                            break;

                        case 2:
                            PersonelMenu.PersonelMenuOptions();
                            break;

                        case 3:
                            CourseMenu.CourseMenuOptions();
                            break;

                        case 4:
                            GradesMenu.GradesMenuOptions();
                            break;

                        case 5:
                            mainLoop = false;
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input. Try again.\n");
                }
            }
        }
    } 
}
