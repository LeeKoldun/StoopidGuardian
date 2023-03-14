using System.ComponentModel.DataAnnotations;

namespace GuardianProCore.Tables;

public class Role
{
    [Key]
    public int IdRole { get; set; }
    public string Name { get; set; }
}