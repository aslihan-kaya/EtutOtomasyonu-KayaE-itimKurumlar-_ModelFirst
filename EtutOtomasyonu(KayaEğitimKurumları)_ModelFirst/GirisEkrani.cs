using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EtutOtomasyonu_KayaEğitimKurumları__ModelFirst
{
    public partial class GirisEkrani : Form
    {
        public GirisEkrani()
        {
            InitializeComponent();
        }
       Model1Container con = new Model1Container();

        private bool Giris(string ad, string sifre)
        {
            var sorgu = from p in con.KullanicilarSet
                        where p.KullaniciAdi == ad && p.Sifre == sifre
                        select p;
            if (sorgu.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
            textBox1.Clear();
            textBox2.Clear();
        }

        private void GirisEkrani_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
            groupBox1.Visible = true;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Visible = true;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Kullanicilar save = new Kullanicilar();
            save.KullaniciAdi = textBox4.Text;
            save.Sifre = textBox3.Text;
            save.Mail = textBox5.Text;
            save.Telefon = textBox7.Text;
            save.Adres = textBox6.Text;
            con.KullanicilarSet.Add(save);
            con.SaveChanges();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (Giris(textBox1.Text, textBox2.Text))
            {
                AnaSayfa anasayfagit = new AnaSayfa();
                anasayfagit.ShowDialog();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı adı ve şifre hatalı");
            }
        }
    }
}
