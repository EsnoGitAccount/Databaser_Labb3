using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Class
{
    public int Id { get; set; }

    public string ClassName { get; set; } = null!;

    public int TeacherId { get; set; }

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();

    public virtual Personel Teacher { get; set; } = null!;
}
