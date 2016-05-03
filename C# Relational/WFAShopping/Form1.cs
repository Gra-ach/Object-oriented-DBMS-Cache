using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Text;
using System.Windows.Forms;
using InterSystems.Data.CacheClient;
using Shopping;

namespace WFAShopping
{
    public partial class Form1 : Form
    {
        private CacheConnection CacheConnect;
        private CacheDataAdapter conAdapter;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                CacheConnect = new CacheConnection();
                CacheConnect.ConnectionString = CacheConnection.ConnectDlg();
                CacheConnect.Open();
                MessageBox.Show("З’єднання виконано успішно");
                populateColumns();
            }
            catch
            {
                MessageBox.Show("Виникла помилка при підключенні");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.shoppingRecordsTableAdapter.Fill(this.uSERDataSet.ShoppingRecords);
        }

        private void button3_Click(object sender, EventArgs e)
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

        private void populateLists(int type, CacheCommand command, ListBox lb, string id)
        {
            lb.Items.Clear();
            command.Parameters.Clear();
            CacheParameter ID_param = new CacheParameter("ShopID", CacheDbType.NVarChar);
            ID_param.Value = id;
            command.Parameters.Add(ID_param);

            try
            {
                CacheDataReader Reader = command.ExecuteReader();
                while (Reader.Read())
                {
                    if (type == 0)
                    {
                        lb.Items.Add(Reader[Reader.GetOrdinal("Type")] + ": "
                                   + Reader[Reader.GetOrdinal("Email")]);
                    }
                    else
                    {
                        lb.Items.Add(Reader[Reader.GetOrdinal("Street")]);
                    }
                };
                Reader.Close();
            }
            catch
            {
                MessageBox.Show("Виникла помилка при заповненні списка");
            }

        }

        private DataColumn createColumn(string name, System.Type type, Boolean readOnly, string caption)
        {
            DataColumn dc = new DataColumn(name, type);
            dc.ReadOnly = readOnly;
            dc.Caption = caption;
            return dc;
        }

        private void populateColumns()
        {
            string selectSQL = "select g.ID, g.childsub, g.ShoppingTrip, g.Name, g.Quantity, g.Price, g.Cost from Shopping.Goods g where ShoppingTrip = ?";
            string updateSQL = "update Shopping.Goods set Name = ?, Price = ?, Quantity = ? where childsub = ?";
            string deleteSQL = "delete from Shopping.Goods where ID = ?";
            string insertSQL = "insert into Shopping.Goods (ShoppingTrip, Name, Price, Quantity) values (?, ?, ?, ?)";

            conAdapter = new CacheDataAdapter(selectSQL, CacheConnect);
            AddInputParams(conAdapter.SelectCommand, "id");

            conAdapter.UpdateCommand = CacheConnect.CreateCommand();
            conAdapter.UpdateCommand.CommandText = updateSQL;
            AddInputParams(conAdapter.UpdateCommand, "Name", "Price", "Quantity", "childsub");

            conAdapter.DeleteCommand = CacheConnect.CreateCommand();
            conAdapter.DeleteCommand.CommandText = deleteSQL;
            AddInputParams(conAdapter.DeleteCommand, "ID");

            conAdapter.InsertCommand = CacheConnect.CreateCommand();
            conAdapter.InsertCommand.CommandText = insertSQL;
            AddInputParams(conAdapter.InsertCommand, "ShoppingTrip", "Name", "Price", "Quantity");

            uSERDataSet.Tables.Add("Goods");            
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("ID", "".GetType(), false, "ID"));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("childsub", "".GetType(), true, "childsub"));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("ShoppingTrip", "".GetType(), false, "Похід в магазин"));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("Name", "".GetType(), false, "Назва товару"));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("Quantity", "".GetType(), false, "Кількість"));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("Price", "".GetType(), false, "Ціна за од."));
            uSERDataSet.Tables["Goods"].Columns.Add(createColumn("Cost", "".GetType(), true, "Вартість"));
            uSERDataSet.Tables["Goods"].PrimaryKey = new DataColumn[] { uSERDataSet.Tables["Goods"].Columns["ID"] };
            dgvGoods.DataSource = uSERDataSet.Tables["Goods"].DefaultView;
        }

        private void AddInputParams(CacheCommand cmd, params string[] cols)
        {
            foreach (String column in cols)
            {
                cmd.Parameters.Add(column, CacheDbType.NVarChar, 50, column);
            }
        }


        private void getShoppingList(string id)
        {
            conAdapter.SelectCommand.Parameters["id"].Value = id;
            uSERDataSet.Tables["Goods"].Clear();
            conAdapter.Fill(uSERDataSet, "Goods");

        }

        private void dgvGoods_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            {
                string ID = uSERDataSet.Tables["Goods"].Rows[e.RowIndex].ItemArray[0].ToString();
                DataRow targetRow = uSERDataSet.Tables["Goods"].Rows.Find(ID);
                targetRow.BeginEdit();
                targetRow.EndEdit();
                conAdapter.Update(uSERDataSet, "Goods");
            }
        }

        private void dgvGoods_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            string ID = e.Row.Cells[0].Value.ToString();           
            DataRow targetRow = uSERDataSet.Tables["Goods"].Rows.Find(ID);
            targetRow.Delete();
            conAdapter.Update(uSERDataSet, "Goods");
        }

        private void dgvRecords_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection DGV = this.dgvRecords.SelectedRows;
            if (DGV.Count == 0) return;
            string ID = uSERDataSet.Tables["ShoppingRecords"].Rows[DGV[0].Index].ItemArray[4].ToString();

            populateLists(0, Shop.GetAllEmails(CacheConnect), lbEmails, ID);
            populateLists(1, Shop.GetShopAddresses(CacheConnect), lbAddresses, ID);
            ID = uSERDataSet.Tables["ShoppingRecords"].Rows[DGV[0].Index].ItemArray[3].ToString();
            getShoppingList(ID);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            DataRow newRow = uSERDataSet.Tables["Goods"].NewRow();            
            newRow["ShoppingTrip"] = uSERDataSet.Tables["ShoppingRecords"].Rows[dgvRecords.SelectedRows[0].Index].ItemArray[3].ToString();
            newRow["Name"] = tbName.Text;
            newRow["Quantity"] = tbQuantity.Text;
            newRow["Price"] = tbPrice.Text;
            newRow["ID"] = "-1";
            uSERDataSet.Tables["Goods"].Rows.Add(newRow);
            conAdapter.Update(uSERDataSet, "Goods");

            tbName.Text = "";
            tbQuantity.Text = "";
            tbPrice.Text = "";

            dgvRecords_RowEnter(null, null);
        }

    }
}
