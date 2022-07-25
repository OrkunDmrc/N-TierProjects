using Katmanli.BLL.Repository;
using Katmanli.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Repository<SiparisDetaylari> spr = new Repository<SiparisDetaylari>();
        private void Form1_Load(object sender, EventArgs e)
        {
            // ÜRÜNLERİ COMBOBOX ' A ATTIK
            comboBox1.DataSource = new Repository<Urunler>().GetAll();
            comboBox1.ValueMember = "UrunId";
            comboBox1.DisplayMember = "UrunAdi";
            comboBox1.SelectedIndex = 0;


            // MÜŞTERİLERİ COMBOBOX ' A ATTIK
            comboBox2.DataSource = new Repository<Musteriler>().GetAll();
            comboBox2.ValueMember = "MusteriId";
            comboBox2.DisplayMember = "MusteriAdi";
            comboBox2.SelectedIndex = 0;
        }

        
        private void button1_Click(object sender, EventArgs e)
        {
            // GETİRMEK İÇİN

            Getir();

        }

        private void Getir()
        {
            dataGridView1.DataSource = new Repository<SiparisDetaylari>().GetAll().Select(ulas => new {
                SiparisId = ulas.SiparisId,
                MusteriAdi = ulas.Siparisler.Musteriler.MusteriAdi,
                UrunAdi = ulas.Urunler.UrunAdi,
                Adres = ulas.Siparisler.SiparisAdresi,
                SiparisAdet = ulas.SiparisEdilenUrunAdeti,
                Fiyat = ulas.Urunler.UrunBirimFiyati,
            }).ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // EKLE
            new Repository<Siparisler>().Insert(new Siparisler
            {
                
                MusteriId=(int)comboBox2.SelectedValue,
                SiparisTarihi = DateTime.Now,
                SiparisAdresi = textBox4.Text,
  

            });
            spr.Insert(new SiparisDetaylari
            {

                // siparisdetay tablosundaki SiparisId = Siparisler tablosundaki SiparisId
                SiparisId = new Repository<Siparisler>().GetAll().Last().SiparisId,
                UrunId = (int)comboBox1.SelectedValue,
                SiparisEdilenUrunAdeti = Convert.ToInt32(textBox3.Text),
                
            });
            Getir();
            Temizle();
        }



        // GÜNCELLEME

        int guncelleme;

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count>0)
            {
                new Repository<Siparisler>().Update(new Siparisler
                {
                    SiparisId=guncelleme,
                    MusteriId = (int)comboBox2.SelectedValue,
                    SiparisTarihi = DateTime.Now,
                    SiparisAdresi = textBox4.Text,
                   
                    
                });
                spr.Update(new SiparisDetaylari
                {
                    SiparisId = guncelleme,
                    UrunId = (int)comboBox1.SelectedValue,
                    SiparisEdilenUrunAdeti = Convert.ToInt32(textBox3.Text),
                });
            }
            Getir();
            Temizle();
        }
        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count >0)
            {
                guncelleme = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            }
            
        }
        
        //SİLME
        int sil;
        private void button4_Click(object sender, EventArgs e)
        {

            if (dataGridView1.SelectedRows.Count > 0)
            {
                //sil = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);



                //spr.Delete(guncelleme);
                //new Repository<Siparisler>().Delete(guncelleme);
                
                MessageBox.Show("Silme işlemi gerçekleştirilemedi !");
                Getir();
                Temizle();
            }
            
        }
        private void Temizle()
        {
            foreach (Control item in Controls)
            {
                if (item is TextBox)
                {
                    TextBox txt = (TextBox)item;
                    txt.Clear();
                }
            }
        }
    }
}
