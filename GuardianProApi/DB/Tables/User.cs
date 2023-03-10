using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProApi.DB.Tables;

public class User
{
    [Key]
    public int IdUser { get; set; }
    public string Login { get; set; }
    public string PasswordHash { get; set; }
    public string PasswordSalt { get; set; }
    public int IdRole { get; set; }
    
    [ForeignKey("IdRole")] 
    public Role Role { get; set; }
}