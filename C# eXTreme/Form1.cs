using System;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using InterSystems.Globals;
using InterSystems.Data.CacheClient;
using System.IO;


namespace eXTremeTest
{
    public partial class Form1 : Form
    {
        private Connection myConn;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            myConn = ConnectionContext.GetConnection();
            if (!myConn.IsConnected())
            {
                myConn.Connect("User", "_SYSTEM", "SYS");
            }

            if (myConn.IsConnected())
            {
                MessageBox.Show("З’єднання з БД виконано");
            }
            else
            {
                MessageBox.Show("З’єднання з БД не було виконано");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (myConn != null && myConn.IsConnected())
                myConn.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            GlobalsDirectory globDir = null;
            try
            {
                globDir = myConn.CreateGlobalsDirectory();
                comboBox1.Items.Clear();
                string globName = "Series";
                while (!globName.Equals(""))
                {
                    comboBox1.Items.Add(globName);
                    globName = globDir.NextGlobalName();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (globDir != null)
                   globDir.Close();
            }
        }

        private void comboBox1_SelectionChangeCommitted(object sender, EventArgs e)
        {
            NodeReference nodeRef = null;
            try
            {
                ComboBox comboBox = (ComboBox)sender;
                string global = comboBox.SelectedItem.ToString();
                nodeRef = myConn.CreateNodeReference(global);
                if (nodeRef.HasData() || nodeRef.HasSubnodes())
                {
                    DialogResult dr = MessageBox.Show("Ви бажаєте видалити існуючий глобал?", "Globals Test", MessageBoxButtons.YesNo);
                    if (dr == DialogResult.Yes)
                    {
                        nodeRef.Kill();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (nodeRef != null)
                    nodeRef.Close();
            }
        }

        private byte[] ReadImage(string p_postedImageFileName)
        {
            FileStream fs = null;
            BinaryReader br = null;
            try
            {
                fs = new FileStream(p_postedImageFileName, FileMode.Open, FileAccess.Read);
                br = new BinaryReader(fs);
                byte[] image = br.ReadBytes((int)fs.Length);
                return image;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }
            finally
            {
                br.Close();
                fs.Close();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            NodeReference nodeRef = null;
            try
            {
                nodeRef = myConn.CreateNodeReference(comboBox1.SelectedItem.ToString());                

                //побудова віртуального дерева індексів
                nodeRef.AppendSubscript("Arrow");
                nodeRef.Set("Spoiled billionaire playboy Oliver Queen is missing and presumed dead when his yacht is lost at sea. He returns five years later a changed man, determined to clean up the city as a hooded vigilante armed with a bow.");

                nodeRef.AppendSubscript(2012);
                ValueList myList = myConn.CreateList();
                myList.Append("Stephen Amell", "Katie Cassidy", "David Ramsey", "Willa Holland", "Paul Blackthorne", "Susanna Thompson", "Emily Bett Rickards");
                nodeRef.Set(myList);
                myList.Close();

                nodeRef.AppendSubscript(1);
                nodeRef.Set(File.ReadAllBytes("E:\\КПИ\\Dropbox\\Асистент\\Постреляционные БД\\Учебное пособие\\Direct access\\arrow_poster_season1.jpg"));

                nodeRef.AppendSubscript(1);
                nodeRef.Set(8.4);

                nodeRef.AppendSubscript("10/10/2012");
                nodeRef.Set(8);

                nodeRef.SetSubscriptCount(3);
                nodeRef.AppendSubscript(2);
                nodeRef.Set(8.3);

                nodeRef.AppendSubscript("10/17/2012");
                nodeRef.Set(8);

                nodeRef.SetSubscriptCount(3);
                nodeRef.AppendSubscript(3);
                nodeRef.Set(8.4);

                nodeRef.AppendSubscript("10/24/2012");
                nodeRef.Set(8);

                nodeRef.SetSubscriptCount(2);
                nodeRef.AppendSubscript(2);
                nodeRef.Set(File.ReadAllBytes("E:\\КПИ\\Dropbox\\Асистент\\Постреляционные БД\\Учебное пособие\\Direct access\\arrow-season-2-poster-cw.jpg"));

                nodeRef.AppendSubscript(1);
                nodeRef.Set(8.9);

                nodeRef.AppendSubscript("10/09/2013");
                nodeRef.Set(8);

                nodeRef.SetSubscriptCount(3);
                nodeRef.AppendSubscript(2);
                nodeRef.Set(8.7);

                nodeRef.AppendSubscript("10/16/2013");
                nodeRef.Set(8);

                //безпосереднє додавання значень без зміни положення поточного елементу                
                nodeRef.SetSubscriptCount(0);
                nodeRef.Set("A lone crimefighter battles the forces of evil with the help of an indestructible and artificially intelligent supercar.", "Knight rider");

                myList = myConn.CreateList();
                myList.Append("Justin Bruening", "Deanna Russo", "Bruce Davison", "Sydney Tamiia Poitier", "Yancey Arias");
                nodeRef.Set(myList, "Knight rider", 2008);
                myList.Close();

                nodeRef.Set(File.ReadAllBytes("E:\\КПИ\\Dropbox\\Асистент\\Постреляционные БД\\Учебное пособие\\Direct access\\knight_rider_2008.jpg"), "Knight rider", 2008, 1);

                nodeRef.Set(6.0, "Knight rider", 2008, 1, 0);
                nodeRef.Set(9, "Knight rider", 2008, 1, 0, "02/17/2008");

                nodeRef.Set(6.0, "Knight rider", 2008, 1, 1);
                nodeRef.Set(7, "Knight rider", 2008, 1, 1, "09/24/2008");

                nodeRef.Set(6.0, "Knight rider", 2008, 1, 2);
                nodeRef.Set(7, "Knight rider", 2008, 1, 2, "10/01/2008");

                //безпосереднє завдання рівня ієрархії дерева, на якому будуть створюватися нові вузли
                nodeRef.AppendSubscript("Knight rider");
                nodeRef.SetSubscript(2, 1982);
                myList = myConn.CreateList();
                myList.Append("David Hasselhoff", "Edward Mulhare", "Richard Basehart", "Patricia McPherson");
                nodeRef.Set(myList);
                myList.Close();

                nodeRef.SetSubscript(3, 1);
                nodeRef.Set(File.ReadAllBytes("E:\\КПИ\\Dropbox\\Асистент\\Постреляционные БД\\Учебное пособие\\Direct access\\knight_rider_1982_season_1.jpg"));

                nodeRef.SetSubscript(4, 1);
                nodeRef.Set(7.2);

                nodeRef.SetSubscript(5, "09/26/1982");
                nodeRef.Set(7);

                nodeRef.SetSubscriptCount(3);
                nodeRef.SetSubscript(4, 2);
                nodeRef.Set(6.8);

                nodeRef.SetSubscript(5, "09/26/1982");
                nodeRef.Set(7);

                nodeRef.SetSubscriptCount(3);
                nodeRef.SetSubscript(4, 3);
                nodeRef.Set(6.8);

                nodeRef.SetSubscript(5, "10/01/1982");
                nodeRef.Set(7);

                nodeRef.SetSubscriptCount(2);
                nodeRef.SetSubscript(3, 2);
                nodeRef.Set(File.ReadAllBytes("E:\\КПИ\\Dropbox\\Асистент\\Постреляционные БД\\Учебное пособие\\Direct access\\knight_rider_1982_season_2.jpg"));

                nodeRef.SetSubscript(4, 1);
                nodeRef.Set(7.8);

                nodeRef.SetSubscript(5, "10/02/1983");
                nodeRef.Set(7);

                nodeRef.SetSubscriptCount(3);
                nodeRef.SetSubscript(4, 2);
                nodeRef.Set(6.8);

                nodeRef.SetSubscript(5, "10/02/1983");
                nodeRef.Set(7);

                nodeRef.SetSubscriptCount(3);
                nodeRef.SetSubscript(4, 3);
                nodeRef.Set(6.9);

                nodeRef.SetSubscript(5, "10/09/1983");
                nodeRef.Set(7);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (nodeRef != null)
                   nodeRef.Close();
            }
        }

        private void AddNodes(NodeReference aNodeRef, string aBaseName, TreeNode aTreeNode)
        {
            try
            {
                aNodeRef.AppendSubscript("");
                string subscr = aNodeRef.NextSubscript();
                TreeNode treeNode = null;
                while (!subscr.Equals(""))
                {
                    aNodeRef.SetSubscript(aNodeRef.GetSubscriptCount(), subscr);
                    if (aNodeRef.HasData())
                    {
                        treeNode = new TreeNode(subscr);
                        if (aTreeNode == null)
                        {
                            treeView1.Nodes.Add(treeNode);
                        }
                        else
                        {
                            aTreeNode.Nodes.Add(treeNode);
                        }
                    }
                    if (aNodeRef.HasSubnodes())
                    {
                        AddNodes(aNodeRef, subscr, treeNode);
                    }
                    subscr = aNodeRef.NextSubscript();
                }
            }
            catch (GlobalsException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                aNodeRef.SetSubscriptCount(aNodeRef.GetSubscriptCount() - 1);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            NodeReference nodeRef = null;
            
            try
            {
                nodeRef = myConn.CreateNodeReference(comboBox1.SelectedItem.ToString());                
                AddNodes(nodeRef, "", null);
                treeView1.ExpandAll();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (nodeRef != null)
                    nodeRef.Close();
            }
        }

        private void formNode(TreeNode aCurNode, NodeReference aNodeRef)
        {
            if (aCurNode.Parent != null)
                formNode(aCurNode.Parent, aNodeRef);
            aNodeRef.AppendSubscript(aCurNode.Text);
        }

        private void treeView1_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            NodeReference nodeRef = null;

            try
            {
                nodeRef = myConn.CreateNodeReference(comboBox1.SelectedItem.ToString());
                formNode(e.Node, nodeRef);

                Object value = nodeRef.GetObject();
                if (value is string)
                {
                    if (nodeRef.GetSubscriptCount() == 1)
                    {
                        textBox1.Text = value.ToString();
                    }
                    else
                        if (nodeRef.GetSubscriptCount() == 2)
                        {
                            ValueList outList = nodeRef.GetList();
                            outList.ResetToFirst();
                            listBox1.Items.Clear();
                            for (int i = 0; i < outList.Length; i++)
                            {
                                listBox1.Items.Add(outList.GetNextObject());
                            }
                            outList.Close();
                        }
                        else
                            if (nodeRef.GetSubscriptCount() == 3)
                            {
                                using (MemoryStream stream = new MemoryStream(nodeRef.GetBytes()))
                                {
                                    pictureBox1.Image = System.Drawing.Image.FromStream(stream);
                                }
                            }
                }
                else if (value is double)
                {
                    textBox2.Text = value.ToString();
                }
                else if (value is int)
                {
                    textBox3.Text = value.ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                if (nodeRef != null)
                    nodeRef.Close();
            }
        }

    }
}
