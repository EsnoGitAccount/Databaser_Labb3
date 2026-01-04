using Databaser_Labb3.Data;
using Databaser_Labb3.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Databaser_Labb3
{
    internal static class PersonelMenu
    {
        internal static void PersonelMenuOptions()
        {
            var context = new SchoolDbContext();
            while (true)
            {
                Console.WriteLine("What would you like to do with the personel data?");
                Console.WriteLine("1. Show personel\n" +
                                    "2. Count peronel by vocation\n" +
                                    "3. Add personel\n" +
                                    "4. Return to main menu");

                if (int.TryParse(Console.ReadLine(), out int input) && input >= 1 && input <= 4)
                {
                    switch (input)
                    {
                        case 1:
                            ShowPersonel(context);
                            break;

                        case 2:
                            CountPersonelByVocation(context);
                            break;

                        case 3:
                            AddPersonel(context);
                            break;

                        case 4:
                            return;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input.");
                }
            }
        }
        private static void ShowPersonel(SchoolDbContext context)
        {
            Console.WriteLine("Which personel would you like to see?");
            int index = 0;
            Console.WriteLine($"1. All personel");
            foreach (var vocation in context.Vocations)
            {
                Console.WriteLine($"{index + 2}. {vocation.Title}");
                index++;
            }
            if (int.TryParse(Console.ReadLine(), out int input) && input == 1)
            {
                foreach (var personel in context.Personels)
                {
                    Console.WriteLine($"{personel.FirstName} {personel.LastName} - {personel.Vocation.Title}");
                }
            }
            else if (input >= 2 && input <= 6)
            {
                var filteredPersonel = context.Personels.Where(p => p.VocationId == (input - 1)).ToList();
                foreach (var personel in filteredPersonel)
                {
                    Console.WriteLine($"{personel.FirstName} {personel.LastName} - {personel.Vocation.Title}");
                }
            }
            else { Console.WriteLine("Invalid input"); }
        }

        // This is the method that is meant to handle the first EF task in Labb 4
        private static void CountPersonelByVocation(SchoolDbContext context)
        {
            foreach (var vocation in context.Vocations.ToList())
            {
                var vocationQuery = context.Personels.Where(p => p.VocationId == vocation.Id).ToList();
                int vocationCount = vocationQuery.Count();
                Console.WriteLine($"Vocation Title: {vocation.Title} | Count {vocationCount}");
            }
        }
        private static void AddPersonel(SchoolDbContext context)
        {
            Console.WriteLine("Adding personel:");
            Console.Write("Enter the first name of the new personel: ");
            string newPersonelFirstName = Console.ReadLine();
            Console.WriteLine();

            Console.Write("Enter the last name of the new personel: ");
            string newPersonelLastName = Console.ReadLine();
            Console.WriteLine();

            Console.Write("Enter the phone number of the new personel: ");
            string newPersonelPhone = Console.ReadLine();
            Console.WriteLine();

            int index = 0;
            Console.WriteLine("Which vocation should this personel have?");
            foreach (Vocation vocation in context.Vocations)
            {
                Console.WriteLine($"{index + 1}. {vocation.Title}");
                index++;
            }

            int newPersonelVocation = 0;
            bool validVocationInput = false;
            while (validVocationInput == false)
            {
                int input = 0;
                if (int.TryParse(Console.ReadLine(), out input) && input >= 1 && input <= (index))
                {
                    newPersonelVocation = input;
                    validVocationInput |= true;
                }
                else
                {
                    Console.WriteLine($"Invalid input. Enter a number between 1 and {index}");
                }
            }
            Vocation newVocation = context.Vocations.FirstOrDefault(v => v.Id == newPersonelVocation);
            Console.WriteLine($"Do you want to add this personel to the personel table?(y/n) \n" +
                    $"Name: {newPersonelFirstName} {newPersonelLastName}\n" +
                    $"Vocation: {newVocation.Title}\n" +
                    $"Phonenumber: {newPersonelPhone}\n");


            string yesNo = Console.ReadLine();
            if (yesNo == "y")
            {
                context.Personels.Add(new Personel
                {
                    FirstName = newPersonelFirstName,
                    LastName = newPersonelLastName,
                    VocationId = newPersonelVocation,
                    PhoneNumber = newPersonelPhone
                });

                context.SaveChanges();
                Console.WriteLine("Added new personel.\n");
            }
            else
            {
                Console.WriteLine("Didn't add personel.");
            }
        }
    }
}
