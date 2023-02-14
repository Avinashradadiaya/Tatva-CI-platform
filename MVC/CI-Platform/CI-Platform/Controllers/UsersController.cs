using Microsoft.AspNetCore.Mvc;

namespace CI_Plateform.Controllers
{
    public class UsersController : Controller
    {
        public IActionResult login()
        {
            return View();
        }
        public IActionResult forgotpasswoard()
        {
            return View();
        }
        public IActionResult Newpasswoard()
        {
            return View();
        }
        
         public IActionResult Register()
        {
            return View();
        }
    }
}
