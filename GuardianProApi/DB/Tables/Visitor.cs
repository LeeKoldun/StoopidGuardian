using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GuardianProApi.DB.Tables;

public class Visitor
{
    [Key]
    public int IdVisitor { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Patronymic { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public string OrganizationName { get; set; }
    public string Note { get; set; }
    public DateTime BirthDate { get; set; }
    public string PassportSeries { get; set; }
    public string PassportNumber { get; set; }
    public byte[] Photo { get; set; }
    public int IdUser { get; set; }
    
    [ForeignKey("IdUser")]
    public virtual User User { get; set; }
}