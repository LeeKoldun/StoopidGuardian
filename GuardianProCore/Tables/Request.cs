using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProCore.Tables;

public class Request
{
    [Key] 
    public int IdRequest { get; set; }

    public int IdRequestStatus { get; set; }
    public int IdUser { get; set; }
    public bool IsPersonal { get; set; }
    public DateTime DateFrom { get; set; }
    public DateTime DateTo { get; set; }
    public int IdVisitType { get; set; }
    public int IdSubdivision { get; set; }
    
    [ForeignKey("IdRequestStatus")] public virtual RequestStatus RequestStatus { get; set; }
    [ForeignKey("IdUser")] public virtual User User { get; set; }
    [ForeignKey("IdVisitType")] public virtual VisitType VisitType { get; set; }
    [ForeignKey("IdSubdivision")] public virtual Subdivision Subdivision { get; set; }
}