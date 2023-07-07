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
    public partial class Ogretmen : Form
    {
        public Ogretmen()
        {
            InitializeComponent();
        }

        private void btnKulup_Click(object sender, EventArgs e)
        {
            Kulup fr = new Kulup();
            fr.Show();
        }

        private void btnDersIslem_Click(object sender, EventArgs e)
        {
            Dersler fr = new Dersler();
            fr.Show();
        }

        private void btnOgrenci_Click(object sender, EventArgs e)
        {
            Ogrenci fr = new Ogrenci();
            fr.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SınavNotlar fr = new SınavNotlar();
            fr.Show();
        }
    }
}
