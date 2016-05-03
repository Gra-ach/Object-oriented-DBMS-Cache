using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using InterSystems.Data.CacheClient;
using InterSystems.Data.CacheTypes;
using Theatres;

namespace ObjectsSample
{
    public partial class Form1 : Form
    {
        private CacheConnection CacheConnect;
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Connect_Click(object sender, EventArgs e)
        {
            try
            {
                CacheConnect = new CacheConnection();
                CacheConnect.ConnectionString = CacheConnection.ConnectDlg();
                CacheConnect.Open();
                MessageBox.Show("З’єднання виконано успішно");                
            }
            catch
            {
                MessageBox.Show("Виникла помилка при підключенні");
            }
        }

        private void Disconnect_Click(object sender, EventArgs e)
        {
            try
            {
                CacheConnect.Close();
                MessageBox.Show("Відключення виконано успішно");
            }
            catch
            {
                MessageBox.Show("Виникла помилка при відключенні");
            }

        }

        private void populateBtn_Click(object sender, EventArgs e)
        {
            string selectSQL = "select ID from Theatres.Theatre";
            try
            {
                CacheCommand command = new CacheCommand(selectSQL, CacheConnect);
                CacheDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    theatresCb.Items.Add(reader[reader.GetOrdinal("ID")]);
                    
                };
                reader.Close();
                command.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Виникла помилка при заповненні списка: "+ex.Message);                
            }

        }

        private void theatresCb_SelectedIndexChanged(object sender, EventArgs e)
        {
            Theatre theatre = Theatre.OpenId(CacheConnect, theatresCb.SelectedItem.ToString());
            playsLv.Items.Clear();
            playsLv.View = View.Details;
            playsLv.FullRowSelect = true;
            playsLv.GridLines = true;

            foreach (Play play in theatre.Plays)            
            {                
                ListViewItem item = new ListViewItem(play.Id());
                item.SubItems.Add(play.Source.Name);
                item.SubItems.Add(play.Source.Author);
                item.SubItems.Add(play.Staged.ToString());
                item.SubItems.Add(play.Source.Synopsis);
                playsLv.Items.Add(item);
            }

            actorsDgv.Rows.Clear();
            foreach (Actor actor in theatre.Actors)
            {
                actorsDgv.Rows.Add(actor.Id(), actor.Name);
            }

            theatre.Close();
        }

        private void addressBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Theatre theatre = Theatre.OpenId(CacheConnect, theatresCb.SelectedItem.ToString());
                MessageBox.Show(theatre.Address.PrintCard());
                theatre.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Виникла помилка при відображенні адреси: " + ex.Message);
            }
        }

        private void playsLv_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (playsLv.SelectedItems.Count == 0) return;
            try {
                Play play = Play.OpenId(CacheConnect, playsLv.SelectedItems[0].Text);
                scriptRtb.LoadFile(play.Script, RichTextBoxStreamType.PlainText);

                rolesLv.Items.Clear();
                rolesLv.View = View.Details;
                rolesLv.FullRowSelect = true;
                rolesLv.GridLines = true;                

                foreach (KeyValuePair<string, Actor> actor in play.Personae)            
                {                
                    ListViewItem item = new ListViewItem(actor.Key);
                    item.SubItems.Add(actor.Value.Name);
                    rolesLv.Items.Add(item);
                }

                
               /*foreach (string photo in play.Photos)
                {
                    MessageBox.Show(photo.ToString());

                    //Image img = Image.FromStream(photo);
                    //photosDgv.Rows.Add(img);
                }*/

                play.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Виникла помилка при відображенні сценарію: "+ex.Message);                
            }
        }

        private void actorsDgv_MouseClick(object sender, MouseEventArgs e)
        {
            //MessageBox.Show(actorsDgv.SelectedRows[0].Cells[0].Value.ToString());

            Actor actor = Actor.OpenId(CacheConnect, actorsDgv.SelectedRows[0].Cells[0].Value.ToString());
            photopb.Image = Image.FromStream(actor.Photo);
            aRoleslv.Items.Clear();
            aRoleslv.View = View.Details;
            aRoleslv.FullRowSelect = true;
            aRoleslv.GridLines = true;
            foreach (string role in actor.Roles)
            {
                ListViewItem item = new ListViewItem(role);
                //item.SubItems.Add(role);
                aRoleslv.Items.Add(item);
            }
            actor.Close();
        }
    }
}
