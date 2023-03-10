using System.ComponentModel.DataAnnotations;

namespace GuardianProApi.DB.Tables;

public class Role
{
    [Key]
    public int IdRole { get; set; }
    public string Name { get; set; }
}