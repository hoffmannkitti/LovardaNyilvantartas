using Microsoft.EntityFrameworkCore;
using lovarda_nyilvantartas_angular.Server.Models;

namespace lovarda_nyilvantartas_angular.Server.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Lovas> Lovasok { get; set; }
        public DbSet<Lo> Lovak { get; set; }
    }
}
