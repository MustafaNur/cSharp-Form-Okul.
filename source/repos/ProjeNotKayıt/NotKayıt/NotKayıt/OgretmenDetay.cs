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
    public partial class OgretmenDetay : Form
    {
        public OgretmenDetay()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection(@"Data Source=DESKTOP-ABE0UME;Initial Catalog=DbNotKayıt;Integrated Security=True");

        void GecenOgrenci()
        {
            baglanti.Open();
            SqlCommand KomutGecenOgrenci = new SqlCommand("Select count(*) from TblDers Where Durum=1 Group By Durum",baglanti);
            SqlDataReader Oku = KomutGecenOgrenci.ExecuteReader();
            while(Oku.Read())
            {
                lblGecenSayısı.Text = Oku[0].ToString();
            }
            baglanti.Close();
        }
        void KalanOgrenci()
        {
            baglanti.Open();
            SqlCommand komutKalanOgrenci = new SqlCommand("Select count(*) from TblDers Where Durum=0 Group By Durum", baglanti);
            SqlDataReader Oku = komutKalanOgrenci.ExecuteReader();
            while (Oku.Read())
            {
                lblKalanSayısı.Text = Oku[0].ToString();
            }
            baglanti.Close();
        }
        private void OgretmenDetay_Load(object sender, EventArgs e)
        {
            // TODO: Bu kod satırı 'dbNotKayıtDataSet.TblDers' tablosuna veri yükler. Bunu gerektiği şekilde taşıyabilir, veya kaldırabilirsiniz.
            this.tblDersTableAdapter.Fill(this.dbNotKayıtDataSet.TblDers);
            GecenOgrenci();
            KalanOgrenci();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("insert into TbDers (OgrNumara, OgrAd, OgrSoyad) values (@p1,@p2, @p3)", baglanti);
            komut.Parameters.AddWithValue("@p1", txtOgrenniNo.Text);
            komut.Parameters.AddWithValue("@p2", txtOgrenciAd.Text);
            komut.Parameters.AddWithValue("@p3", txtOgrenciSoyad.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Öğrenci sisteme eklendi");
            this.tblDersTableAdapter.Fill(this.dbNotKayıtDataSet.TblDers);

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int secilen = dataGridView1.SelectedCells[0].RowIndex;
            txtOgrenniNo.Text = dataGridView1.Rows[secilen].Cells[1].Value.ToString();
            txtOgrenciAd.Text = dataGridView1.Rows[secilen].Cells[2].Value.ToString();
            txtOgrenciSoyad.Text = dataGridView1.Rows[secilen].Cells[3].Value.ToString();
            txtSınav1.Text = dataGridView1.Rows[secilen].Cells[4].Value.ToString();
            txtSınav2.Text = dataGridView1.Rows[secilen].Cells[5].Value.ToString();
            txtSınav3.Text = dataGridView1.Rows[secilen].Cells[6].Value.ToString();
            
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            double ortalama, s1, s2, s3;
            string durum;
            s1 = Convert.ToDouble(txtSınav1.Text);
            s2 = Convert.ToDouble(txtSınav2.Text);
            s3 = Convert.ToDouble(txtSınav3.Text);

            ortalama = (s1+s2+s3)/3;
            lblOrtalama.Text = ortalama.ToString();

            if (ortalama>=50)
            {
                durum = "True";
            }
            else
            {
                durum = "False";
            }
            
            baglanti.Open();
            SqlCommand komutGuncelle = new SqlCommand("update TblDers set OgrS1=@p1, OgrS2=@p2, OgrS3=@p3, Ortalama=@p4, Durum=@p5 Where OgrNumara=@p6", baglanti);
            komutGuncelle.Parameters.AddWithValue("@p1", txtSınav1.Text);
            komutGuncelle.Parameters.AddWithValue("@p2", txtSınav2.Text);
            komutGuncelle.Parameters.AddWithValue("@p3", txtSınav3.Text);
            komutGuncelle.Parameters.AddWithValue("@p4", decimal.Parse(lblOrtalama.Text));
            komutGuncelle.Parameters.AddWithValue("@p5", durum);
            komutGuncelle.Parameters.AddWithValue("@p6", txtOgrenniNo.Text);
            komutGuncelle.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Öğrenci notları güncellendi");
            this.tblDersTableAdapter.Fill(this.dbNotKayıtDataSet.TblDers);

        }
    }
}
