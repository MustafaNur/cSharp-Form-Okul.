using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace NotKayıt
{
    public partial class OgrenciDetay : Form
    {
        //Data Source=DESKTOP-ABE0UME;Initial Catalog=DbNotKayıt;Integrated Security=True
        public OgrenciDetay()
        {
            InitializeComponent();
        }
        public string numara;

        SqlConnection baglanti = new SqlConnection(@"Data Source=DESKTOP-ABE0UME;Initial Catalog=DbNotKayıt;Integrated Security=True");
        private void OgrenciDetay_Load(object sender, EventArgs e)
        {
            lblNumara.Text = numara;

            

            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * From TblDers Where OgrNumara = @OgrenciNumara", baglanti);
            komut.Parameters.AddWithValue("@OgrenciNumara", numara);
            //SqlDataReader dr = komut.ExecuteReader();
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read())
            {
                lblAdSoyad.Text = oku[2].ToString() + " " + oku[3].ToString();
                lblSınav1.Text = oku[4].ToString();
                lblSınav2.Text = oku[5].ToString();
                lblSınav3.Text = oku[6].ToString();
                lblOrtalama.Text = oku[7].ToString();
                lblDurum.Text = oku[8].ToString();
            }
            baglanti.Close();
            if (lblDurum.Text == "True")
            {
                lblDurum.Text = "Geçti";
            }
            else if (lblDurum.Text == "False")
            {
                lblDurum.Text = "Kaldı";
            }
            
        }
    }
}
