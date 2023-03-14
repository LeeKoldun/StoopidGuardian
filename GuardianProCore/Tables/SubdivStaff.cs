using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.VisualBasic.CompilerServices;

namespace GuardianProCore.Tables;

public class SubdivStaff
{
    [Key] 
    public IntegerType IdSubdivStaff { get; set; }

    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Patronymic { get; set; }
    public int IdSubdivision { get; set; }
    public int IdUser { get; set; }
    
    [ForeignKey("IdSubdivision")] public virtual Subdivision Subdivision { get; set; }
    [ForeignKey("IdUser")] public virtual User User { get; set; }
}