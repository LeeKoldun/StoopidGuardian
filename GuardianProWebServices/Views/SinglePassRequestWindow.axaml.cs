using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using GuardianProWebServices.ViewModels;

namespace GuardianProWebServices.Views;

public partial class SinglePassRequestWindow : Window
{
    public SinglePassRequestWindow()
    {
        InitializeComponent();
#if DEBUG
        this.AttachDevTools();
#endif

        var vm = new SingleRequestVM();
        vm.CurWindow = this;

        DataContext = vm;
    }

    private void InitializeComponent()
    {
        AvaloniaXamlLoader.Load(this);
    }
}