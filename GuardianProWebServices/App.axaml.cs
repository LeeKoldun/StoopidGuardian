using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using GuardianProWebServices.ViewModels;
using GuardianProWebServices.Views;

namespace GuardianProWebServices;

public partial class App : Application
{
    public override void Initialize()
    {
        AvaloniaXamlLoader.Load(this);
    }

    public override void OnFrameworkInitializationCompleted()
    {
        if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
        {
            var win = new MainWindow();
            win.Show();
        }

        base.OnFrameworkInitializationCompleted();
    }
}