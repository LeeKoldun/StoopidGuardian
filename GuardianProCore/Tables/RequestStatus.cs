using System.ComponentModel.DataAnnotations;

namespace GuardianProCore.Tables;

public class RequestStatus
{
    [Key] 
    public int IdRequestStatus { get; set; }

    public string StatusName { get; set; }
}