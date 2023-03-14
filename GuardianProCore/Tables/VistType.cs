using System.ComponentModel.DataAnnotations;

namespace GuardianProCore.Tables;

public class VisitType
{
    [Key] 
    public int IdVisitType { get; set; }

    public string TypeName { get; set; }
}