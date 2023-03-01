using CI_platform.Models;
using CI_Platform.Models.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;

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


        [HttpPost]
        public IActionResult ForgotPassword(ForgotPasswordViewModel viewmodel)
        {


            if (ModelState.IsValid)
            {
                CiPlatformDbContext context = new CiPlatformDbContext();

                var data = context.Users.Where(e => e.Email == viewmodel.Email).FirstOrDefault();

                if (data != null)
                {

                    Random random = new Random();

                    int capitalCharCode = random.Next(65, 91);
                    char randomCapitalChar = (char)capitalCharCode;


                    int randomint = random.Next();


                    int SmallcharCode = random.Next(97, 123);
                    char randomChar = (char)SmallcharCode;

                    String token = "";
                    token += randomCapitalChar.ToString();
                    token += randomint.ToString();
                    token += randomChar.ToString();


                    var PasswordResetLink = Url.Action("ResetPassword", "Home", new { Email = viewmodel.Email, Token = token }, Request.Scheme);

                    var ResetPasswordInfo = new PasswordReset()
                    {
                        Email = viewmodel.Email,
                        Token = token
                    };
                    context.PasswordResets.Add(ResetPasswordInfo);
                    context.SaveChanges();


                    var fromEmail = new MailAddress("avinashradadiya21@gmail.com");
                    var toEmail = new MailAddress(viewmodel.Email);
                    var fromEmailPassword = "tkyrydgjwmtwiemj";
                    string subject = "Reset Password";
                    string body = PasswordResetLink;

                    var smtp = new SmtpClient
                    {

                        Host = "smtp.gmail.com",
                        Port = 587,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromEmail.ToString(), fromEmailPassword)
                    };

                    MailMessage message = new MailMessage(fromEmail, toEmail);
                    message.Subject = subject;
                    message.Body = body;
                    message.IsBodyHtml = true;
                    smtp.Send(message);


                }
                else
                {
                    ModelState.AddModelError("Email", "Email is not Registered");

                }
            }
            else
            {
                return View(viewmodel);
            }
            return View(viewmodel);
        }
        public IActionResult ResetPassword(String email, String token)
        {

            ResetPasswordViewModel validation = new ResetPasswordViewModel()
            {
                Email = email,
                Token = token
            };


            return View(validation);

        }

        [HttpPost]
        public IActionResult ResetPAssword(ResetPasswordViewModel viewmodel)
        {
            CiPlatformDbContext context = new CiPlatformDbContext();

            var ResetPasswordData = context.PasswordResets.Any(e => e.Email == viewmodel.Email && e.Token == viewmodel.Token);


            if (ResetPasswordData)
            {
                var x = context.Users.FirstOrDefault(e => e.Email == viewmodel.Email);


                x.Password = viewmodel.Password;


                context.Users.Update(x);
                context.SaveChanges();

            }
            else
            {
                ModelState.AddModelError("Token", "Reset Passwordword Link is Invalid");
            }
            return View(viewmodel);
        }


        public IActionResult ForgotPassword()
        {
            return View();
        }

        public IActionResult ResetPassword()
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
