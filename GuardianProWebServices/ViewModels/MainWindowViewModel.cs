using System;
using System.Reactive;
using Avalonia.Controls;
using GuardianProWebServices.Views;
using ReactiveUI;

namespace GuardianProWebServices.ViewModels;

public class MainWindowViewModel : ViewModelBase
{
    public void ToSinglePassRequest()
    {
        new SinglePassRequestWindow().Show();
        CurWindow.Close();
    }
    
    public void ToGroupPassRequest()
    {
        new GroupPassRequest().Show();
        CurWindow.Close();
    }
}