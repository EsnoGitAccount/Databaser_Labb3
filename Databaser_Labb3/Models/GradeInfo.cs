using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class GradeInfo
{
    public int Id { get; set; }

    public string GradeName { get; set; } = null!;

    public int GradeValue { get; set; }

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();
}
