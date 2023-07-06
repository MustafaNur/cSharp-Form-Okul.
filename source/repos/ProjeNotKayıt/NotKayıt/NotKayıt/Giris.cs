using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NotKayıt
{
    public partial class Giris : Form
    {
        public Giris()
        {
            InitializeComponent();
        }

        
        private void button1_Click(object sender, EventArgs e)
        {
            OgrenciDetay frm = new OgrenciDetay();
            frm.numara = textBox1.Text;
            frm.Show();
            //this.Hide();
        }

        private void Giris_Load(object sender, EventArgs e)
        {
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (textBox1.Text == "Admin")
            {
                OgretmenDetay frm = new OgretmenDetay();
                frm.Show();
            }
        }
    }
}
