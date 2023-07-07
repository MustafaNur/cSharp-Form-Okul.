using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OkulProje
{
    public partial class Ogrenci : Form
    {
        public Ogrenci()
        {
            InitializeComponent();
        }

        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-ABE0UME;Initial Catalog=Okul;Integrated Security=True");


        DataSet1TableAdapters.OgrencilerTableAdapter ds = new DataSet1TableAdapters.OgrencilerTableAdapter();
        private void Ogrenci_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = ds.GetOgrenciListesi();
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select * From Tbl_Kulupler", baglanti); 
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            comboBox1.DisplayMember = "KulupAd";
            comboBox1.ValueMember= "KulupID";
            comboBox1.DataSource= dt;
            baglanti.Close();
        }

        string c = "";
        private void btnEkle_Click(object sender, EventArgs e)
        {
            
           
            ds.OgrenciEkle(txtOgrenciAd.Text, txtOgrenciSoyad.Text, byte.Parse(comboBox1.SelectedValue.ToString()), c);
            MessageBox.Show("Öğrenci Eklendi");
        }

        private void btnListele_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = ds.GetOgrenciListesi();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            ds.OgrenciSil(int.Parse(txtID.Text));
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            ds.OgrenciGuncelle(txtOgrenciAd.Text, txtOgrenciSoyad.Text, c, byte.Parse( comboBox1.SelectedValue.ToString()), int.Parse(txtID.Text) );
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked == true)
            {
                c = "KIZ";
            }
            
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            
            if (radioButton2.Checked == true)
            {
                c = "ERKEK";
            }
        }
    }
}
