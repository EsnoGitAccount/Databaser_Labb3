using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Grade
{
    public int Id { get; set; }

    public int StudentId { get; set; }

    public int TeacherId { get; set; }

    public int CourseId { get; set; }

    public int Grade1 { get; set; }

    public DateOnly DateAssigned { get; set; }

    public virtual Course Course { get; set; } = null!;

    public virtual GradeInfo Grade1Navigation { get; set; } = null!;

    public virtual Student Student { get; set; } = null!;

    public virtual Personel Teacher { get; set; } = null!;
}
