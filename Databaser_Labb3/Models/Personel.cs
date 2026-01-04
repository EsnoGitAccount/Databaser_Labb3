using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Personel
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public int VocationId { get; set; }

    public string PhoneNumber { get; set; } = null!;

    public DateOnly? StartDate { get; set; }

    public DateOnly? QuitDate { get; set; }

    public int? MonthlySalary { get; set; }

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual Vocation Vocation { get; set; } = null!;
}
