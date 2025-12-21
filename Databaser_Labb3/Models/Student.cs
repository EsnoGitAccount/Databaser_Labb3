using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Student
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public int? ClassId { get; set; }

    public string PhoneNumber { get; set; } = null!;

    public string ParentPhoneNumber { get; set; } = null!;

    public virtual Class? Class { get; set; }

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual ICollection<JunctionCourseAssignment> JunctionCourseAssignments { get; set; } = new List<JunctionCourseAssignment>();
}
