namespace WFAShopping
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dgvRecords = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.shoppingDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contactswwwDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.shoppingRecordsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.uSERDataSet = new WFAShopping.USERDataSet();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.dgvGoods = new System.Windows.Forms.DataGridView();
            this.lbAddresses = new System.Windows.Forms.ListBox();
            this.lbEmails = new System.Windows.Forms.ListBox();
            this.shoppingRecordsTableAdapter = new WFAShopping.USERDataSetTableAdapters.ShoppingRecordsTableAdapter();
            this.tbName = new System.Windows.Forms.TextBox();
            this.tbQuantity = new System.Windows.Forms.TextBox();
            this.tbPrice = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button4 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRecords)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.shoppingRecordsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.uSERDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoods)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvRecords
            // 
            this.dgvRecords.AllowUserToAddRows = false;
            this.dgvRecords.AllowUserToDeleteRows = false;
            this.dgvRecords.AutoGenerateColumns = false;
            this.dgvRecords.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.ColumnHeader;
            this.dgvRecords.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCellsExceptHeaders;
            this.dgvRecords.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRecords.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.shoppingDateDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn,
            this.contactswwwDataGridViewTextBoxColumn});
            this.dgvRecords.DataSource = this.shoppingRecordsBindingSource;
            this.dgvRecords.Location = new System.Drawing.Point(13, 49);
            this.dgvRecords.MultiSelect = false;
            this.dgvRecords.Name = "dgvRecords";
            this.dgvRecords.ReadOnly = true;
            this.dgvRecords.RowHeadersWidth = 10;
            this.dgvRecords.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvRecords.Size = new System.Drawing.Size(411, 151);
            this.dgvRecords.TabIndex = 0;
            this.dgvRecords.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvRecords_RowEnter);
            // 
            // ID
            // 
            this.ID.DataPropertyName = "ID";
            this.ID.HeaderText = "ID";
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 43;
            // 
            // shoppingDateDataGridViewTextBoxColumn
            // 
            this.shoppingDateDataGridViewTextBoxColumn.DataPropertyName = "ShoppingDate";
            this.shoppingDateDataGridViewTextBoxColumn.HeaderText = "Дата покупки";
            this.shoppingDateDataGridViewTextBoxColumn.Name = "shoppingDateDataGridViewTextBoxColumn";
            this.shoppingDateDataGridViewTextBoxColumn.ReadOnly = true;
            this.shoppingDateDataGridViewTextBoxColumn.Width = 94;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Назва магазину";
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn.Width = 105;
            // 
            // contactswwwDataGridViewTextBoxColumn
            // 
            this.contactswwwDataGridViewTextBoxColumn.DataPropertyName = "Contacts_www";
            this.contactswwwDataGridViewTextBoxColumn.HeaderText = "Internet адреса магазину";
            this.contactswwwDataGridViewTextBoxColumn.Name = "contactswwwDataGridViewTextBoxColumn";
            this.contactswwwDataGridViewTextBoxColumn.ReadOnly = true;
            this.contactswwwDataGridViewTextBoxColumn.Width = 144;
            // 
            // shoppingRecordsBindingSource
            // 
            this.shoppingRecordsBindingSource.DataMember = "ShoppingRecords";
            this.shoppingRecordsBindingSource.DataSource = this.uSERDataSet;
            // 
            // uSERDataSet
            // 
            this.uSERDataSet.DataSetName = "USERDataSet";
            this.uSERDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(13, 13);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "Connect";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(108, 13);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "Select";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(205, 13);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 3;
            this.button3.Text = "Disconnect";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // dgvGoods
            // 
            this.dgvGoods.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvGoods.Location = new System.Drawing.Point(12, 229);
            this.dgvGoods.MultiSelect = false;
            this.dgvGoods.Name = "dgvGoods";
            this.dgvGoods.Size = new System.Drawing.Size(714, 140);
            this.dgvGoods.TabIndex = 4;
            this.dgvGoods.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvGoods_CellValueChanged);            
            this.dgvGoods.UserDeletingRow += new System.Windows.Forms.DataGridViewRowCancelEventHandler(this.dgvGoods_UserDeletingRow);
            // 
            // lbAddresses
            // 
            this.lbAddresses.FormattingEnabled = true;
            this.lbAddresses.Location = new System.Drawing.Point(439, 52);
            this.lbAddresses.Name = "lbAddresses";
            this.lbAddresses.Size = new System.Drawing.Size(287, 56);
            this.lbAddresses.TabIndex = 5;
            // 
            // lbEmails
            // 
            this.lbEmails.FormattingEnabled = true;
            this.lbEmails.Location = new System.Drawing.Point(439, 118);
            this.lbEmails.Name = "lbEmails";
            this.lbEmails.Size = new System.Drawing.Size(287, 82);
            this.lbEmails.TabIndex = 6;
            // 
            // shoppingRecordsTableAdapter
            // 
            this.shoppingRecordsTableAdapter.ClearBeforeFill = true;
            // 
            // tbName
            // 
            this.tbName.Location = new System.Drawing.Point(13, 398);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(170, 20);
            this.tbName.TabIndex = 7;
            // 
            // tbQuantity
            // 
            this.tbQuantity.Location = new System.Drawing.Point(215, 398);
            this.tbQuantity.Name = "tbQuantity";
            this.tbQuantity.Size = new System.Drawing.Size(170, 20);
            this.tbQuantity.TabIndex = 8;
            // 
            // tbPrice
            // 
            this.tbPrice.Location = new System.Drawing.Point(417, 398);
            this.tbPrice.Name = "tbPrice";
            this.tbPrice.Size = new System.Drawing.Size(170, 20);
            this.tbPrice.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 376);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "Назва товару";
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(621, 398);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(105, 23);
            this.button4.TabIndex = 11;
            this.button4.Text = "Add goods";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(212, 376);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(90, 13);
            this.label2.TabIndex = 12;
            this.label2.Text = "Кількість товару";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(414, 376);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Ціна за од.";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(738, 430);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbPrice);
            this.Controls.Add(this.tbQuantity);
            this.Controls.Add(this.tbName);
            this.Controls.Add(this.lbEmails);
            this.Controls.Add(this.lbAddresses);
            this.Controls.Add(this.dgvGoods);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dgvRecords);
            this.Name = "Form1";
            this.Text = "SQL доступ";
            ((System.ComponentModel.ISupportInitialize)(this.dgvRecords)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.shoppingRecordsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.uSERDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGoods)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvRecords;
        private USERDataSet uSERDataSet;
        private System.Windows.Forms.BindingSource shoppingRecordsBindingSource;
        private USERDataSetTableAdapters.ShoppingRecordsTableAdapter shoppingRecordsTableAdapter;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.DataGridView dgvGoods;
        private System.Windows.Forms.ListBox lbAddresses;
        private System.Windows.Forms.ListBox lbEmails;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn shoppingDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn contactswwwDataGridViewTextBoxColumn;
        private System.Windows.Forms.TextBox tbName;
        private System.Windows.Forms.TextBox tbQuantity;
        private System.Windows.Forms.TextBox tbPrice;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
    }
}

