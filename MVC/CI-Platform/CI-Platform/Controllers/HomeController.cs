using CI_platform.Models;
using CI_Platform.Models.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CI_platform.Controllers
{
    public class HomeController : Controller
    {
        private readonly CiPlatformDbContext _db;

        public HomeController(CiPlatformDbContext db)
        {
            _db = db;
        }

        public IActionResult login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult login(User user)
        {
            var data = _db.Users.Where(e => e.Email == user.Email && e.Password == user.Password).FirstOrDefault();

            if(data == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Home");
            }
        }

        public IActionResult Newpasswoard()
        {
            return View();
        }

        public IActionResult Registerform()
        {
            return View();
        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Registerform(User obj)
        {

            _db.Users.Add(obj);
            _db.SaveChanges();
            return RedirectToAction("Login");


        }

        public IActionResult Home()
        {
            return View();
        }
        public IActionResult Nomissionfound()
        {
            return View();
        }
        public IActionResult VolunteeringMissionPage()
        {
            return View();
        }
        public IActionResult StoriesListing()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}