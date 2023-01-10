using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DL;

public partial class JavilesExamenTecnico2Context : DbContext
{
    public JavilesExamenTecnico2Context()
    {
    }

    public JavilesExamenTecnico2Context(DbContextOptions<JavilesExamenTecnico2Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Medicamento> Medicamentos { get; set; }

    public virtual DbSet<Proveedor> Proveedors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-DODRMCNA; Database= JAvilesExamenTecnico2; Trusted_Connection=True; User ID=sa; Password=pass@word1;TrustServerCertificate=True; ");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Medicamento>(entity =>
        {
            entity.HasKey(e => e.IdMedicamento).HasName("PK__Medicame__AC96376EE229EB25");

            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FechaCaducidad)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("fechaCaducidad");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdProveedorNavigation).WithMany(p => p.Medicamentos)
                .HasForeignKey(d => d.IdProveedor)
                .HasConstraintName("FK__Medicamen__IdPro__1273C1CD");
        });

        modelBuilder.Entity<Proveedor>(entity =>
        {
            entity.HasKey(e => e.IdProveedor).HasName("PK__Proveedo__E8B631AF3977B8A5");

            entity.ToTable("Proveedor");

            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
