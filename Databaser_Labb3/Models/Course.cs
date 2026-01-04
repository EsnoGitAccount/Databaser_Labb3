using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Course
{
    public int Id { get; set; }

    public string CourseName { get; set; } = null!;

    public int? TeacherId { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual ICollection<JunctionCourseAssignment> JunctionCourseAssignments { get; set; } = new List<JunctionCourseAssignment>();

    public virtual Personel? Teacher { get; set; }
}
