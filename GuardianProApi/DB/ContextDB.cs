using GuardianProCore.Tables;
using Microsoft.EntityFrameworkCore;

namespace GuardianProApi.DB;

public class ContextDB : DbContext
{
    public DbSet<Visitor> Visitor { get; set; }
    public DbSet<User> User { get; set; }
    public DbSet<Role> Role { get; set; }

    public ContextDB()
    {
        Database.EnsureCreated();
    }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
        optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=GuardianProDB;Username=postgres;Password=123");
    }
}