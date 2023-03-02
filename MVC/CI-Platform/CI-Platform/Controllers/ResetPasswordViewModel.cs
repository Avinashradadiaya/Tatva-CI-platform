namespace CI_platform.Controllers
{
    public class ResetPasswordViewModel
    {

        public string Password { get; set; } = null!;

        public string ConfirmPassword { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string Token { get; set; } = null!;
    }
}