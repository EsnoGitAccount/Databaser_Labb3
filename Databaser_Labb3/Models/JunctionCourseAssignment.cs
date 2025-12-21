using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class JunctionCourseAssignment
{
    public int Id { get; set; }

    public int StudentId { get; set; }

    public int CourseId { get; set; }

    public virtual Course Course { get; set; } = null!;

    public virtual Student Student { get; set; } = null!;
}
