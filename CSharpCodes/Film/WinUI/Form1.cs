using BLL.Repository;
using DAL;
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
        Repository<FilmDetay> kf = new Repository<FilmDetay>();
        private void Form1_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = new Repository<Kategoriler>().GetAll();
            comboBox1.ValueMember = "KategoriId";
            comboBox1.DisplayMember = "KategoriAdi";
            comboBox1.SelectedIndex = 0;

            comboBox2.DataSource = new Repository<YapimSirketleri>().GetAll();
            comboBox2.ValueMember = "YapimSirketiId";
            comboBox2.DisplayMember = "YapimSirketiAdi";
            comboBox2.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {

            Goster();
        }

        private void Goster()
        {
            dataGridView1.DataSource = new Repository<FilmDetay>().GetAll().Select(kfl => new
            {

                FilmId = kfl.FilmId,
                FilmAdi = kfl.Filmler.FilmAdi,
                Kategoriler = kfl.Filmler.FilmDetay.Kategoriler.KategoriAdi,
                Yapimci = kfl.Filmler.FilmDetay.YapimSirketleri.YapimSirketiAdi,
            }).ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new Repository<Filmler>().Insert(new Filmler
            {
                FilmKapakResmi = "http",
                FilmAdi = textBox1.Text,

            });
            kf.Insert(new FilmDetay { KategoriId = (int)comboBox1.SelectedValue, FilmId = new Repository<Filmler>().GetAll().Last().FilmId, YapimSirketiId = (int)comboBox2.SelectedValue });
            Temizle();
            Goster();


        }
        int guncelle;
        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                new Repository<Filmler>().Update(new Filmler
                {
                    FilmId = guncelle,
                    FilmAdi = textBox1.Text,
                    FilmKapakResmi = "http",

                });
                FilmDetay fd = kf.Get(guncelle);
                fd.KategoriId = (int)comboBox1.SelectedValue;
                fd.YapimSirketiId = (int)comboBox2.SelectedValue;
                kf.Update(fd);
                Temizle();
                Goster();


            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                guncelle = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);
                kf.Delete(id);
                MessageBox.Show("Kayıt Silindi");
                Temizle();
                Goster();


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
