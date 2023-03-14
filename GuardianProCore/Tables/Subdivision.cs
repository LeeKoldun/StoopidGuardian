using System.ComponentModel.DataAnnotations;

namespace GuardianProCore.Tables;

public class Subdivision
{
    [Key] 
    public int IdSubdivision { get; set; }
    public string Name { get; set; }
}