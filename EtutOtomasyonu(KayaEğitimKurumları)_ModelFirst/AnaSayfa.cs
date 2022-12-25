using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace EtutOtomasyonu_KayaEğitimKurumları__ModelFirst
{
    public partial class AnaSayfa : Form
    {
        public AnaSayfa()
        {
            InitializeComponent();
        }
        Model1Container con = new Model1Container();

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void AnaSayfa_Load(object sender, EventArgs e)
        {

        }

        private void button16_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = con.EtutSalonuSet.ToList();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            EtutSalonu save = new EtutSalonu();
         
            save.SalonAdi = textBox3.Text;
            save.KullaniciNo = textBox5.Text;
            con.EtutSalonuSet.Add(save);
            con.SaveChanges();
            dataGridView1.DataSource = con.EtutSalonuSet.ToList();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            int mno = Convert.ToInt32(textBox4.Text);
            var yenile = con.EtutSalonuSet.Where(x => x.SalonNo == mno).FirstOrDefault();
            yenile.SalonAdi = textBox3.Text;
            yenile.KullaniciNo = textBox5.Text;
            con.SaveChanges();
            dataGridView1.DataSource = con.EtutSalonuSet.ToList();
        }

        private void button13_Click(object sender, EventArgs e)
        {
            int mno = Convert.ToInt32(textBox4.Text);
            var sil = con.EtutSalonuSet.Where(x => x.SalonNo == mno).FirstOrDefault();
            con.EtutSalonuSet.Remove(sil);
            con.SaveChanges();
            dataGridView1.DataSource = con.EtutSalonuSet.ToList();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox4.Text = satir.Cells["SalonNo"].Value.ToString();
            textBox3.Text = satir.Cells["SalonAdi"].Value.ToString();
            textBox5.Text = satir.Cells["KullaniciAdi"].Value.ToString();
        }

        private void button7_Click(object sender, EventArgs e)
        {

        }
    }
    }

