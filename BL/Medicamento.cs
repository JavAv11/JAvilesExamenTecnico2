using Microsoft.EntityFrameworkCore;
using System.Diagnostics.Metrics;

namespace BL
{
    public class Medicamento
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.JavilesExamenTecnico2Context context = new DL.JavilesExamenTecnico2Context())
                {
                    var query = context.Medicamentos.FromSqlRaw("MedicamentosGetAll").ToList();

                    result.Objects = new List<object>();
                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Medicamento medicamento = new ML.Medicamento();
                            medicamento.IdMedicamento = obj.IdMedicamento;
                            medicamento.Nombre = obj.Nombre;
                            medicamento.Descripcion = obj.Descripcion;
                            medicamento.fechaCaducidad = obj.FechaCaducidad;
                            medicamento.PrecioUnitario = obj.PrecioUnitario.Value;
                            medicamento.Stock = obj.Stock.Value;

                            medicamento.Proveedor = new ML.Proveedor();
                            medicamento.Proveedor.IdProveedor = obj.IdProveedor.Value;
                            medicamento.Proveedor.Nombre = obj.NombreProveedores;

                            result.Objects.Add(medicamento);
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

        public static ML.Result GetById(int IdMedicamento)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.JavilesExamenTecnico2Context context = new DL.JavilesExamenTecnico2Context())
                {
                    var query = context.Medicamentos.FromSqlRaw($"MedicamentosGetById {IdMedicamento}").AsEnumerable().FirstOrDefault();

                    if (query != null)
                    {

                        ML.Medicamento medicamento = new ML.Medicamento();

                        medicamento.Nombre = query.Nombre;
                        medicamento.Descripcion = query.Descripcion;
                        medicamento.fechaCaducidad = query.FechaCaducidad;
                        medicamento.PrecioUnitario = query.PrecioUnitario.Value;
                        medicamento.Stock = query.Stock.Value;

                        medicamento.Proveedor = new ML.Proveedor();
                        medicamento.Proveedor.IdProveedor = query.IdProveedor.Value;
                        medicamento.Proveedor.Nombre = query.NombreProveedores;

                        result.Objects.Add(medicamento);

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

        public static ML.Result Add(ML.Medicamento medicamento)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.JavilesExamenTecnico2Context context = new DL.JavilesExamenTecnico2Context())
                {
                    //var query = context.Medicamentos.ExecuteSqlRaw($"AddMedicamento '{medicamento.Nombre}','{medicamento.Descripcion}','{medicamento.fechaCaducidad}',{medicamento.PrecioUnitario},{medicamento.Stock},{medicamento.Proveedor.IdProveedor}");
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