
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

 
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=login}/{id?}");

app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=Registerform}");

app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=Forgotpasswoard}");

app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=Newpasswoard}");
app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=Home}");
app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=Nomissionfound}");
app.MapControllerRoute(
    name: "",
    pattern: "{controller=Home}/{action=VolunteeringMissionPage}");






app.Run();
