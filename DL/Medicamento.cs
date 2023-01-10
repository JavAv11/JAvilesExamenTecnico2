using System;
using System.Collections.Generic;

namespace DL;

public partial class Medicamento
{
    public int IdMedicamento { get; set; }

    public string? Nombre { get; set; }

    public string? Descripcion { get; set; }

    public string? FechaCaducidad { get; set; }

    public int? PrecioUnitario { get; set; }

    public int? Stock { get; set; }

    public int? IdProveedor { get; set; }

    public virtual Proveedor? IdProveedorNavigation { get; set; }

    public string NombreProveedores { get; set; }


}
