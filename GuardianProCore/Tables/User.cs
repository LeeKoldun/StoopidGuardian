using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProCore.Tables;

public class User
{
    [Key]
    public int IdUser { get; set; }
    public string Login { get; set; }
    public string PasswordHash { get; set; }
    public string PasswordSalt { get; set; }
    public int IdRole { get; set; }
    
    [ForeignKey("IdRole")] 
    public virtual Role Role { get; set; }
}