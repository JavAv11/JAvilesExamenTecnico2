using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client;

namespace PL.Controllers
{
    public class Medicamento : Controller
    {
        [HttpGet]
        public ActionResult GetAll()
        {
            ML.Medicamento medicamento = new ML.Medicamento();


            medicamento.Proveedor = new ML.Proveedor();

            ML.Result resultProveedor = BL.Proveedor.GetAll();

            ML.Result result = BL.Medicamento.GetAll();

            if (result.Correct)
            {
                medicamento.Proveedor.Proveedores = resultProveedor.Objects;
                medicamento.Medicamentos = result.Objects;

                return View(medicamento);
            }
            else
            {
                ViewBag.Message("Error al consultar datos");
                return PartialView("Modal");
            }
        }

        //[HttpGet]
        //public ActionResult Form() { }
    }
}
