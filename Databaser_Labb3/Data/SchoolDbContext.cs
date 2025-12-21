using System;
using System.Collections.Generic;
using Databaser_Labb3.Models;
using Microsoft.EntityFrameworkCore;

namespace Databaser_Labb3.Data;

public partial class SchoolDbContext : DbContext
{
    public SchoolDbContext()
    {
    }

    public SchoolDbContext(DbContextOptions<SchoolDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Class> Classes { get; set; }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<Grade> Grades { get; set; }

    public virtual DbSet<GradeInfo> GradeInfos { get; set; }

    public virtual DbSet<JunctionCourseAssignment> JunctionCourseAssignments { get; set; }

    public virtual DbSet<Personel> Personels { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<Vocation> Vocations { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-6A7FN98;Database=SchoolDb_Labb2;Integrated Security=True;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Class>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Classes__3214EC0720CD323C");

            entity.Property(e => e.ClassName).HasMaxLength(50);

            entity.HasOne(d => d.Teacher).WithMany(p => p.Classes)
                .HasForeignKey(d => d.TeacherId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Personel_Classes");
        });

        modelBuilder.Entity<Course>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Courses__3214EC0776A0AC9D");

            entity.Property(e => e.CourseName).HasMaxLength(50);

            entity.HasOne(d => d.Teacher).WithMany(p => p.Courses)
                .HasForeignKey(d => d.TeacherId)
                .HasConstraintName("FK_Personel_Courses");
        });

        modelBuilder.Entity<Grade>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Grades__3214EC07231EFDEA");

            entity.Property(e => e.Grade1).HasColumnName("Grade");

            entity.HasOne(d => d.Course).WithMany(p => p.Grades)
                .HasForeignKey(d => d.CourseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Courses_Grades");

            entity.HasOne(d => d.Grade1Navigation).WithMany(p => p.Grades)
                .HasForeignKey(d => d.Grade1)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_GradeInfo_Grades");

            entity.HasOne(d => d.Student).WithMany(p => p.Grades)
                .HasForeignKey(d => d.StudentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Students_Grades");

            entity.HasOne(d => d.Teacher).WithMany(p => p.Grades)
                .HasForeignKey(d => d.TeacherId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Personel_Grades");
        });

        modelBuilder.Entity<GradeInfo>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__GradeInf__3214EC07FC13BAA6");

            entity.ToTable("GradeInfo");

            entity.Property(e => e.GradeName).HasMaxLength(8);
        });

        modelBuilder.Entity<JunctionCourseAssignment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Junction__3214EC07B898D8D4");

            entity.ToTable("Junction_CourseAssignment");

            entity.HasOne(d => d.Course).WithMany(p => p.JunctionCourseAssignments)
                .HasForeignKey(d => d.CourseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Courses_CourseAssignment");

            entity.HasOne(d => d.Student).WithMany(p => p.JunctionCourseAssignments)
                .HasForeignKey(d => d.StudentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Students_CourseAssignment");
        });

        modelBuilder.Entity<Personel>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Personel__3214EC07DCC3FEED");

            entity.ToTable("Personel");

            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.PhoneNumber).HasMaxLength(50);

            entity.HasOne(d => d.Vocation).WithMany(p => p.Personels)
                .HasForeignKey(d => d.VocationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Vocations_Personel");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Students__3214EC072678DFBB");

            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
            entity.Property(e => e.ParentPhoneNumber).HasMaxLength(50);
            entity.Property(e => e.PhoneNumber).HasMaxLength(50);

            entity.HasOne(d => d.Class).WithMany(p => p.Students)
                .HasForeignKey(d => d.ClassId)
                .HasConstraintName("FK_Classes_Students");
        });

        modelBuilder.Entity<Vocation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Vocation__3214EC0720EE9A2D");

            entity.Property(e => e.Title).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
