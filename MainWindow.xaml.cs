using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;

namespace przykład
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DataTable dataTable = new DataTable();

        public MainWindow()
        {
            InitializeComponent();
            string connetionString;
            connetionString = @"Data Source=DESKTOP-U1A6KEO\SQLEXPRESS;Initial Catalog=Konfigurator;Integrated Security=SSPI;";
            string query = "select * from Opcje";

            SqlConnection conn = new SqlConnection(connetionString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dataTable);
            conn.Close();
            da.Dispose();

            List<Opcja> opcje = new List<Opcja>();
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                Opcja opcja = new Opcja();
                opcja.Kategoria = dataTable.Rows[i]["Kategoria"].ToString();
                opcja.Opis = dataTable.Rows[i]["Opis"].ToString();
                opcja.Rodzaj = dataTable.Rows[i]["Rodzaj"].ToString();
                opcja.Cena = Convert.ToDecimal(dataTable.Rows[i]["Cena"]);
                opcje.Add(opcja);
            }

            foreach(var opcja in opcje.Where(o => o.Kategoria == "Silnik                                            "))
            {
                SilnikiComboBox.Items.Add($"{opcja.Rodzaj} - {opcja.Opis}");
            }
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }

    class Opcja
    {
        public int Id { get; set;}
        public string Kategoria { get; set; }
        public string Rodzaj { get; set; }
        public string Opis { get; set; }
        public decimal Cena { get; set; }
    }
}
