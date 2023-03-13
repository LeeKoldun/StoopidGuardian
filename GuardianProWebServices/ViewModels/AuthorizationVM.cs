using System.Reactive;

namespace GuardianProWebServices.ViewModels;

public class AuthorizationVM : ViewModelBase
{
    public string Login { get; set; }
    public string Password { get; set; }
    
    public void Auth()
    {
        if (Login == null|| Password == null)
        {
            
        }
    }
    
    public string ErrorMsg { get; set; }
    public bool ErrorIsVisible { get; set; }
}