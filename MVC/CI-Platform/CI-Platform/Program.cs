using Microsoft.Extensions.FileSystemGlobbing.Internal;
using System.Xml.Linq;

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
    name: "default",
    pattern: "{controller=Users}/{action=login}/{id?}");



app.MapControllerRoute(
    name: "Users",
    pattern: "{controller=Users}/{action=forgotpasswoard}");

app.MapControllerRoute(
    name: "Users",
    pattern: "{controller=Users}/{action=Newpasswoard}");

app.MapControllerRoute(
    name: "Users",
    pattern: "{controller=Users}/{action=Register}");

app.Run();

