using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace GuardianProWebServices.Views;

public partial class AuthorizationWindow : Window
{
    public AuthorizationWindow()
    {
        InitializeComponent();
#if DEBUG
        this.AttachDevTools();
#endif
        
        
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
}