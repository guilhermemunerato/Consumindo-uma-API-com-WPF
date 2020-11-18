using DesafioSTI3.DAL;
using DesafioSTI3.Data;
using DesafioSTI3.Models;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using System.Windows;

namespace DesafioSTI3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private async void BtnCarregarDados_Click(object sender, RoutedEventArgs e)
        {
            // Cria o objeto de leitura de dados
            WebDataReader wdr = new WebDataReader();

            // Exibição dos Dados no Grid através de chamada ao método do objeto WebDataReader
            var dados = await wdr.GetPedidosApi();
            DbgDados.ItemsSource = dados;

            MessageBox.Show("Dados Carregados");
        }
    }


}
