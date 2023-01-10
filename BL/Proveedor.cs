using Microsoft.EntityFrameworkCore;
using ML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Proveedor
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.JavilesExamenTecnico2Context context = new DL.JavilesExamenTecnico2Context())
                {
                    var query = context.Proveedors.FromSqlRaw("ProveedorGetAll").ToList();

                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Proveedor proveedor = new ML.Proveedor();
                            proveedor.IdProveedor = obj.IdProveedor;
                            proveedor.Nombre = obj.NombreProveedores;

                            result.Objects.Add(proveedor);
                        }
                        result.Correct = true;

                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
    }
}
