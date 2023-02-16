
using category.Models;
using Microsoft.EntityFrameworkCore;

namespace category.Data
{
    public class ApplicationDbContext : DbContext

    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
        public DbSet<Category> Category { get; set; }

     
    }


}

