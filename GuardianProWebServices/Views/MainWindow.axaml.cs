using Avalonia.Controls;
using GuardianProWebServices.ViewModels;

namespace GuardianProWebServices.Views;

public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();

        var vm = new MainWindowViewModel();
        vm.CurWindow = this;

        DataContext = vm;
    }
}