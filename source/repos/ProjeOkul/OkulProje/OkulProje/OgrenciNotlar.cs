﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace OkulProje
{
    public partial class OgrenciNotlar : Form
    {
        public OgrenciNotlar()
        {
            InitializeComponent();
        }

        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-ABE0UME;Initial Catalog=Okul;Integrated Security=True");
        public string numara;
        private void OgrenciNotlar_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select DersAd, Sınav1, Sınav2, Sınav3 Proje, Ortalama, Durum From Notlar Inner Joın Dersler On Notlar.DersID=Dersler.DersID Where OgrenciID=1", baglanti);
            komut.Parameters.AddWithValue("@p1", numara);
            
            //this.Text =numara.ToString();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource= dt;
        }
    }
}
