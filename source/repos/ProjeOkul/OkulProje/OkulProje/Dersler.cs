using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OkulProje
{
    public partial class Dersler : Form
    {
        public Dersler()
        {
            InitializeComponent();
        }

        DataSet1TableAdapters.DerslerTableAdapter ds = new DataSet1TableAdapters.DerslerTableAdapter();

        private void Dersler_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = ds.GetDersListesi();
        }

        private void btnListele_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = ds.GetDersListesi();
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            ds.DersEkle(txtKulupAd.Text);
            MessageBox.Show("Ders eklendi");

        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            ds.DersSil(byte.Parse(txtKulupAd.Text));
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            ds.DersGuncelle(txtKulupAd.Text, byte.Parse(txtKulupID.Text));
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtKulupID.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtKulupID.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
        }
    }
}
