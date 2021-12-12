using System;
using MahApps.Metro.Controls;
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
    public partial class MainWindow 
    {
        DataTable dataTable = new DataTable();
        List<Wersja> wersja = new List<Wersja>();
        List<Opcja> opcje = new List<Opcja>();

        public MainWindow()
        {
            InitializeComponent();
            wersja.Add(new Wersja { Opis = "domyślne" });
            string connetionString;
            connetionString = @"Data Source=DESKTOP-U1A6KEO\SQLEXPRESS;Initial Catalog=konfigurator;Integrated Security=SSPI;";
            string query = "select * from Opcje";

            SqlConnection conn = new SqlConnection(connetionString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dataTable);
            conn.Close();
            da.Dispose();

            
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                Opcja opcja = new Opcja();
                opcja.Nazwa = dataTable.Rows[i]["Nazwa"].ToString();
                opcja.Opis = dataTable.Rows[i]["Opis"].ToString();
                // opcja.Rodzaj = dataTable.Rows[i]["Rodzaj"].ToString();
                opcja.Kategoria = dataTable.Rows[i]["Kategoria"].ToString();

                opcja.Cena = Convert.ToDecimal(dataTable.Rows[i]["Cena"]);
                opcje.Add(opcja);
            }


                foreach (var opcja in opcje.Where(o => o.Kategoria == "1"))
                {
                    SilnikiComboBox.Items.Add($"{opcja.Nazwa} - {opcja.Cena}");
                }
                foreach (var opcja in opcje.Where(o => o.Kategoria == "4"))
                {
                    OponyComboBox.Items.Add($"{opcja.Nazwa} - {opcja.Cena}");
                }
                foreach (var opcja in opcje.Where(o => o.Kategoria == "5"))
                {
                    DodatkiListBox.Items.Add($"{opcja.Nazwa}");

                }
                foreach (var opcja in opcje.Where(o => o.Kategoria == "7"))
                {
                    PakietyListBox.Items.Add($"{opcja.Nazwa}");
                }

                //foreach (var opcja in opcje.Where(o => o.Kategoria == "1"))
                //{
                //    //OpisLabel.Content = from o in opcje where o.Kategoria == "1" && o.Nazwa == SilnikiComboBox.SelectedValue.ToString() select "1";

                //    OpisLabel.Content = opcja.Opis;
                //}

        }

        class Opcja
        {
            public int Id { get; set; }
            public string Nazwa { get; set; }
            public string Rodzaj { get; set; }
            public string Opis { get; set; }
            public decimal Cena { get; set; }
            public string Kategoria { get; set; }
        }
        class Wersja
        {
            public int Id { get; set; }
            public string Nazwa { get; set; }
            public string Opis { get; set; }
        }

         private void SilnikiComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
         {
            //if (wersja.Where(w => w.Opis == SilnikiComboBox.SelectedValue.ToString()) != null)
            //{
            //   wersja.Where(w => w.Opis == SilnikiComboBox.SelectedValue.ToString()).FirstOrDefault().Opis;
            //}

             foreach (var opcja in opcje.Where(o => o.Nazwa+ " - " + o.Cena == SilnikiComboBox.SelectedValue.ToString()))
                {
                    //OpisLabel.Content = from o in opcje where o.Kategoria == "1" && o.Nazwa == SilnikiComboBox.SelectedValue.ToString() select "1";

                    OpisLabel.Content = opcja.Opis;
                }
        }

    }

}
