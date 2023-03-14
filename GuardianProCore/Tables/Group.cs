using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProCore.Tables;

public class Group
{
    [Key] 
    public int IdGroup { get; set; }

    public int IdSubdivision { get; set; }
    public int IdSubdivStaff { get; set; }
    
    [ForeignKey("IdSubdivision")] public virtual Subdivision Subdivision { get; set; }
    [ForeignKey("IdSubdivStaff")] public virtual SubdivStaff SubdivStaff { get; set; }
}