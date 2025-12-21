using System;
using System.Collections.Generic;

namespace Databaser_Labb3.Models;

public partial class Vocation
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public virtual ICollection<Personel> Personels { get; set; } = new List<Personel>();
}
