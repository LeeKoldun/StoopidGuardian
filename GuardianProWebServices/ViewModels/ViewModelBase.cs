using Avalonia.Controls;
using GuardianProWebServices.Views;
using ReactiveUI;

namespace GuardianProWebServices.ViewModels;

public class ViewModelBase : ReactiveObject
{
    public Window CurWindow { get; set; }
    public void GoToAuth()
    {
        new AuthorizationWindow().Show();
        CurWindow.Close();
    }
}