using Hastane.BLL;
using Hastane.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
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
        Repository<Muayeneler> m = new Repository<Muayeneler>();

        private void Form1_Load(object sender, EventArgs e)
        {
            button3.Enabled = false;
            button5.Enabled = false;
            FormLoad();
        }

        private void FormLoad()
        {
            comboBoxHKBolum.DataSource = new Repository<Bolumler>().GetAll();
            comboBoxHKBolum.ValueMember = "BolumId";
            comboBoxHKBolum.DisplayMember = "BolumAdi";
            comboBoxHKBolum.SelectedIndex = 0;

            comboBoxPBolum.DataSource = comboBoxHKBolum.DataSource;
            comboBoxPBolum.ValueMember = "BolumId";
            comboBoxPBolum.DisplayMember = "BolumAdi";
            comboBoxPBolum.SelectedIndex = 0;

            comboBoxHKDoktor.DataSource = new Repository<Doktorlar>().GetAll().Select(d => new { Id = d.DoktorId, AdSoyad = d.DoktorAdi + " " + d.DoktorSoyadi }).ToList();
            comboBoxHKDoktor.ValueMember = "Id";
            comboBoxHKDoktor.DisplayMember = "AdSoyad";
            comboBoxHKDoktor.SelectedIndex = 0;

            comboBoxPUnvan.Items.Add("Idari Personel");
            comboBoxPUnvan.Items.Add("Doktor");
            comboBoxPUnvan.Items.Add("Hemsire");
            comboBoxPUnvan.Items.Add("Diger");
            comboBoxPUnvan.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            

            FillData();
        }
        private void FillData()
        {
            if (tabControl1.SelectedIndex == 0)
            {
                try
                {
                    dataGridView1.DataSource = new Repository<Muayeneler>().GetAll().Select(mu => new
                    {
                        Id = mu.MuayeneId,
                        TC = mu.Hastalar.HastaTC,
                        Adi = mu.Hastalar.HastaAdi,
                        Soyadi = mu.Hastalar.HastaSoyadi,
                        DogumTarihi = mu.Hastalar.HastaDogumTarihi,
                        Tel = mu.Hastalar.HastaTel,
                        Adres = mu.Hastalar.HastaAdresi,
                        MuayeneTarihi = mu.MuayeneTarihi,
                        Doktor = mu.Doktorlar.DoktorAdi + " " + mu.Doktorlar.DoktorSoyadi
                    }).ToList();
                }
                catch (Exception ex)
                {

                    MessageBox.Show(ex.Message.ToString());
                }
                
            }
            else if (tabControl1.SelectedIndex == 1)
            {
                
                try
                {
                    switch (comboBoxPUnvan.SelectedIndex)
                    {
                        case 0:
                            dataGridView1.DataSource = new Repository<IdariPersonel>().GetAll().ToList();
                            break;
                        case 1:
                            dataGridView1.DataSource = new Repository<Doktorlar>().GetAll().Select(g => new
                            {
                                Id = g.DoktorId,
                                Bolum = g.Bolumler.BolumAdi,
                                AdiSoyadi = g.DoktorAdi + " " + g.DoktorSoyadi,
                                DogumTarihi = g.DoktorDogumTarihi,
                                Adres = g.DoktorAdresi,
                                Tel = g.DoktorTel
                            }).ToList();
                            break;
                        case 2:
                            dataGridView1.DataSource = new Repository<Hemsireler>().GetAll().Select(g => new
                            {
                                Id = g.HemsireId,
                                Bolum = g.Bolumler.BolumAdi,
                                AdiSoyadi = g.HemsireAdi + " " + g.HemsireSoyadi,
                                DogumTarihi = g.HemsireDogumTarihi,
                                Adres = g.HemsireAdresi,
                                Tel = g.HemsireTel
                            }).ToList();
                            break;
                        case 3:
                            dataGridView1.DataSource = new Repository<Personeller>().GetAll().Select(g => new
                            {
                                Id = g.PersonelId,
                                Bolum = g.Bolumler.BolumAdi,
                                AdiSoyadi = g.PersonelAdi + " " + g.PersonelSoyadi,
                                DogumTarihi = g.PersonelDogumTarihi,
                                Adres = g.PersonelAdresi,
                                Tel = g.PersonelTel
                            }).ToList();
                            break;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if(tabControl1.SelectedIndex == 0 && textBoxHKAdi.Text != "")
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    m.Insert(new Muayeneler { HastaId = m.GetById(id).HastaId, DoktorId = (int)comboBoxHKDoktor.SelectedValue, MuayeneTarihi = DateTime.Now, Durum = true });
                }
                else
                {
                    //MessageBox.Show(new Repository<Hastalar>().GetAll().Last().HastaId + "");
                    new Repository<Hastalar>().Insert(new Hastalar
                    {
                        HastaTC = textBoxHKTC.Text,
                        HastaAdi = textBoxHKAdi.Text,
                        HastaSoyadi = textBoxHKSoyadi.Text,
                        HastaDogumTarihi = dateTimePicker1.Value,
                        HastaAdresi = textBoxHKAdresi.Text,
                        HastaTel = textBoxHKTel.Text,
                        Durum = true
                    });
                    m.Insert(new Muayeneler { HastaId = new Repository<Hastalar>().GetAll().Last().HastaId, DoktorId = (int)comboBoxHKDoktor.SelectedValue, MuayeneTarihi = DateTime.Now, Durum = true });
                }
            }
            else if(tabControl1.SelectedIndex == 1 && textBoxPAdi.Text != "")
            {
                switch (comboBoxPUnvan.SelectedIndex)
                {
                    case 0:
                        new Repository<IdariPersonel>().Insert( new IdariPersonel { 
                            IdariPersonelAdi = textBoxPAdi.Text, 
                            IdariPersonelSoyadi = textBoxPSoyadi.Text, 
                            IdariPersonelDogumTarihi = dateTimePicker2.Value,
                            IdariPersonelAdresi = textBoxPAdres.Text,
                            IdariPersonelTel = textBoxPTel.Text,
                            Durum = true
                        });
                        break;
                    case 1:
                        new Repository<Doktorlar>().Insert(new Doktorlar
                        {
                            BolumId = (int)comboBoxPBolum.SelectedValue,
                            DoktorAdi = textBoxPAdi.Text,
                            DoktorSoyadi = textBoxPSoyadi.Text,
                            DoktorDogumTarihi = dateTimePicker2.Value,
                            DoktorAdresi = textBoxPAdres.Text,
                            DoktorTel = textBoxPTel.Text,
                            Durum = true
                        });
                        if (checkBox1.Checked)
                        {
                            new Repository<IdariPersonel>().Insert(new IdariPersonel
                            {
                                IdariPersonelAdi = textBoxPAdi.Text,
                                IdariPersonelSoyadi = textBoxPSoyadi.Text,
                                IdariPersonelDogumTarihi = dateTimePicker2.Value,
                                IdariPersonelAdresi = textBoxPAdres.Text,
                                IdariPersonelTel = textBoxPTel.Text,
                                Durum = true
                            });
                        }
                        break;
                    case 2:
                        new Repository<Hemsireler>().Insert(new Hemsireler
                        {
                            BolumId = (int)comboBoxPBolum.SelectedValue,
                            HemsireAdi = textBoxPAdi.Text,
                            HemsireSoyadi = textBoxPSoyadi.Text,
                            HemsireDogumTarihi = dateTimePicker2.Value,
                            HemsireAdresi = textBoxPAdres.Text,
                            HemsireTel = textBoxPTel.Text,
                            Durum = true
                        });
                        break;
                    case 3:
                        new Repository<Personeller>().Insert(new Personeller
                        {
                            BolumId = (int)comboBoxPBolum.SelectedValue,
                            PersonelAdi = textBoxPAdi.Text,
                            PersonelSoyadi = textBoxPSoyadi.Text,
                            PersonelDogumTarihi = dateTimePicker2.Value,
                            PersonelAdresi = textBoxPAdres.Text,
                            PersonelTel = textBoxPTel.Text,
                            Durum = true
                        });
                        break;
                }
            }
            Temizle();
            FillData();

        }
        private void button3_Click(object sender, EventArgs e)
        {
            if(tabControl1.SelectedIndex == 0)
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    new Repository<Hastalar>().Update(new Hastalar {
                        HastaId = m.GetById(id).HastaId,
                        HastaTC = textBoxHKTC.Text,
                        HastaAdi = textBoxHKAdi.Text,
                        HastaSoyadi = textBoxHKSoyadi.Text,
                        HastaDogumTarihi = dateTimePicker1.Value,
                        HastaAdresi = textBoxHKAdresi.Text,
                        HastaTel = textBoxHKTel.Text
                    });
                    Muayeneler mu = m.GetById(id);
                    mu.DoktorId = (int)comboBoxHKDoktor.SelectedValue;
                    mu.MuayeneTarihi = DateTime.Now;
                    m.Update(mu);
                }
            }
            else
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    switch (comboBoxPUnvan.SelectedIndex)
                    {
                        case 0:
                            new Repository<IdariPersonel>().Update(new IdariPersonel
                            {
                                IdariPersonelId = id,
                                IdariPersonelAdi = textBoxPAdi.Text,
                                IdariPersonelSoyadi = textBoxPSoyadi.Text,
                                IdariPersonelDogumTarihi = dateTimePicker2.Value,
                                IdariPersonelAdresi = textBoxPAdres.Text,
                                IdariPersonelTel = textBoxPTel.Text,
                            });
                            break;
                        case 1:
                            new Repository<Doktorlar>().Update(new Doktorlar
                            {
                                DoktorId = id,
                                BolumId = (int)comboBoxPBolum.SelectedValue,
                                DoktorAdi = textBoxPAdi.Text,
                                DoktorSoyadi = textBoxPSoyadi.Text,
                                DoktorDogumTarihi = dateTimePicker2.Value,
                                DoktorAdresi = textBoxPAdres.Text,
                                DoktorTel = textBoxPTel.Text,
                            });
                            break;
                        case 2:
                            new Repository<Hemsireler>().Update(new Hemsireler
                            {
                                HemsireId = id,
                                BolumId = (int)comboBoxPBolum.SelectedValue,
                                HemsireAdi = textBoxPAdi.Text,
                                HemsireSoyadi = textBoxPSoyadi.Text,
                                HemsireDogumTarihi = dateTimePicker2.Value,
                                HemsireAdresi = textBoxPAdres.Text,
                                HemsireTel = textBoxPTel.Text,
                                Durum = true
                            });
                            break;
                        case 3:
                            new Repository<Personeller>().Update(new Personeller
                            {
                                PersonelId = id,
                                BolumId = (int)comboBoxPBolum.SelectedValue,
                                PersonelAdi = textBoxPAdi.Text,
                                PersonelSoyadi = textBoxPSoyadi.Text,
                                PersonelDogumTarihi = dateTimePicker2.Value,
                                PersonelAdresi = textBoxPAdres.Text,
                                PersonelTel = textBoxPTel.Text,
                                Durum = true
                            });
                            break;
                    }
                }
            }
            Temizle();
            FillData();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            
        }

        int id = -1;
        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value);
                if (tabControl1.SelectedIndex == 0)
                {
                    textBoxHKTC.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                    textBoxHKAdi.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                    textBoxHKSoyadi.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                    dateTimePicker1.Value = (DateTime)dataGridView1.Rows[e.RowIndex].Cells[4].Value;
                    textBoxHKTel.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                    textBoxHKAdresi.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
                }
                else if(tabControl1.SelectedIndex == 1)
                {
                    textBoxPAdi.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                    textBoxPSoyadi.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                    dateTimePicker2.Value = (DateTime)dataGridView1.Rows[e.RowIndex].Cells[3].Value;
                    textBoxPAdres.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                    textBoxPTel.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                }
            }
            button2.Enabled = true;
            button3.Enabled = true;
            button5.Enabled = true; 
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (tabControl1.SelectedIndex == 0)
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    m.Delete(id);
                }
            }
            else if(tabControl1.SelectedIndex == 1)
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    switch (comboBoxPUnvan.SelectedIndex)
                    {
                        case 0:
                            new Repository<IdariPersonel>().Delete(id);
                            break;
                        case 1:
                            new Repository<Doktorlar>().Delete(id);
                            break;
                        case 2:
                            new Repository<Hemsireler>().Delete(id);
                            break;
                        case 3:
                            new Repository<Personeller>().Delete(id);
                            break;
                    }
                }
            }
            FillData();
            Temizle();
        }
        private void Temizle()
        {
            textBoxHKTC.Text = "";
            textBoxHKAdi.Text = "";
            textBoxHKSoyadi.Text = "";
            textBoxHKTel.Text = "";
            textBoxHKAdresi.Text = "";
            button3.Enabled = false;
            button5.Enabled = false;
        }

        private void comboBoxPUnvan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBoxPUnvan.SelectedIndex == 0)
            {
                checkBox1.Visible = true;
            }
            else
            {
                checkBox1.Visible = false;
            }
        }
    }
}
