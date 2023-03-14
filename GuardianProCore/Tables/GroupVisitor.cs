using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProCore.Tables;

public class GroupVisitor
{
    [Key] 
    public int IdGroupVisitor { get; set; }

    public int IdGroup { get; set; }
    public int IdVisitor { get; set; }
    
    [ForeignKey("IdGroup")] public virtual Group Group { get; set; }
    [ForeignKey("IdVisitor")] public virtual Visitor Type { get; set; }
}