namespace ObjectsSample
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
            this.connectBtn = new System.Windows.Forms.Button();
            this.disconnectBtn = new System.Windows.Forms.Button();
            this.populateBtn = new System.Windows.Forms.Button();
            this.theatresCb = new System.Windows.Forms.ComboBox();
            this.addressBtn = new System.Windows.Forms.Button();
            this.playsLv = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.scriptRtb = new System.Windows.Forms.RichTextBox();
            this.actorsDgv = new System.Windows.Forms.DataGridView();
            this.actorId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.actorName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.rolesLv = new System.Windows.Forms.ListView();
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.photopb = new System.Windows.Forms.PictureBox();
            this.aRoleslv = new System.Windows.Forms.ListView();
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            ((System.ComponentModel.ISupportInitialize)(this.actorsDgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.photopb)).BeginInit();
            this.SuspendLayout();
            // 
            // connectBtn
            // 
            this.connectBtn.Location = new System.Drawing.Point(13, 13);
            this.connectBtn.Name = "connectBtn";
            this.connectBtn.Size = new System.Drawing.Size(75, 23);
            this.connectBtn.TabIndex = 0;
            this.connectBtn.Text = "Connect";
            this.connectBtn.UseVisualStyleBackColor = true;
            this.connectBtn.Click += new System.EventHandler(this.Connect_Click);
            // 
            // disconnectBtn
            // 
            this.disconnectBtn.Location = new System.Drawing.Point(634, 11);
            this.disconnectBtn.Name = "disconnectBtn";
            this.disconnectBtn.Size = new System.Drawing.Size(75, 23);
            this.disconnectBtn.TabIndex = 1;
            this.disconnectBtn.Text = "Disconnect";
            this.disconnectBtn.UseVisualStyleBackColor = true;
            this.disconnectBtn.Click += new System.EventHandler(this.Disconnect_Click);
            // 
            // populateBtn
            // 
            this.populateBtn.Location = new System.Drawing.Point(111, 12);
            this.populateBtn.Name = "populateBtn";
            this.populateBtn.Size = new System.Drawing.Size(75, 23);
            this.populateBtn.TabIndex = 2;
            this.populateBtn.Text = "Theatres";
            this.populateBtn.UseVisualStyleBackColor = true;
            this.populateBtn.Click += new System.EventHandler(this.populateBtn_Click);
            // 
            // theatresCb
            // 
            this.theatresCb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.theatresCb.FormattingEnabled = true;
            this.theatresCb.Location = new System.Drawing.Point(209, 13);
            this.theatresCb.Name = "theatresCb";
            this.theatresCb.Size = new System.Drawing.Size(272, 21);
            this.theatresCb.TabIndex = 3;
            this.theatresCb.SelectedIndexChanged += new System.EventHandler(this.theatresCb_SelectedIndexChanged);
            // 
            // addressBtn
            // 
            this.addressBtn.Location = new System.Drawing.Point(506, 12);
            this.addressBtn.Name = "addressBtn";
            this.addressBtn.Size = new System.Drawing.Size(108, 23);
            this.addressBtn.TabIndex = 4;
            this.addressBtn.Text = "Show address";
            this.addressBtn.UseVisualStyleBackColor = true;
            this.addressBtn.Click += new System.EventHandler(this.addressBtn_Click);
            // 
            // playsLv
            // 
            this.playsLv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4,
            this.columnHeader5});
            this.playsLv.Location = new System.Drawing.Point(13, 51);
            this.playsLv.Name = "playsLv";
            this.playsLv.Size = new System.Drawing.Size(409, 116);
            this.playsLv.TabIndex = 6;
            this.playsLv.UseCompatibleStateImageBehavior = false;
            this.playsLv.SelectedIndexChanged += new System.EventHandler(this.playsLv_SelectedIndexChanged);
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "ID";
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Назва п’єси";
            this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Автор";
            this.columnHeader3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Рік постановки";
            this.columnHeader4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "Опис";
            // 
            // scriptRtb
            // 
            this.scriptRtb.Location = new System.Drawing.Point(12, 338);
            this.scriptRtb.Name = "scriptRtb";
            this.scriptRtb.Size = new System.Drawing.Size(696, 149);
            this.scriptRtb.TabIndex = 7;
            this.scriptRtb.Text = "";
            // 
            // actorsDgv
            // 
            this.actorsDgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.actorsDgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.actorId,
            this.actorName});
            this.actorsDgv.Location = new System.Drawing.Point(444, 51);
            this.actorsDgv.MultiSelect = false;
            this.actorsDgv.Name = "actorsDgv";
            this.actorsDgv.ReadOnly = true;
            this.actorsDgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.actorsDgv.ShowEditingIcon = false;
            this.actorsDgv.Size = new System.Drawing.Size(264, 269);
            this.actorsDgv.TabIndex = 8;
            this.actorsDgv.MouseClick += new System.Windows.Forms.MouseEventHandler(this.actorsDgv_MouseClick);
            // 
            // actorId
            // 
            this.actorId.HeaderText = "ID";
            this.actorId.Name = "actorId";
            this.actorId.Visible = false;
            // 
            // actorName
            // 
            this.actorName.HeaderText = "Ім’я актора";
            this.actorName.Name = "actorName";
            this.actorName.Width = 200;
            // 
            // rolesLv
            // 
            this.rolesLv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader6,
            this.columnHeader7});
            this.rolesLv.Location = new System.Drawing.Point(13, 187);
            this.rolesLv.Name = "rolesLv";
            this.rolesLv.Size = new System.Drawing.Size(263, 133);
            this.rolesLv.TabIndex = 9;
            this.rolesLv.UseCompatibleStateImageBehavior = false;
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Роль";
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Актор";
            // 
            // photopb
            // 
            this.photopb.Location = new System.Drawing.Point(282, 187);
            this.photopb.Name = "photopb";
            this.photopb.Size = new System.Drawing.Size(140, 133);
            this.photopb.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.photopb.TabIndex = 11;
            this.photopb.TabStop = false;
            // 
            // aRoleslv
            // 
            this.aRoleslv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader9});
            this.aRoleslv.Location = new System.Drawing.Point(718, 51);
            this.aRoleslv.Name = "aRoleslv";
            this.aRoleslv.Size = new System.Drawing.Size(171, 436);
            this.aRoleslv.TabIndex = 12;
            this.aRoleslv.UseCompatibleStateImageBehavior = false;
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "Роль";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(900, 494);
            this.Controls.Add(this.aRoleslv);
            this.Controls.Add(this.photopb);
            this.Controls.Add(this.rolesLv);
            this.Controls.Add(this.actorsDgv);
            this.Controls.Add(this.scriptRtb);
            this.Controls.Add(this.playsLv);
            this.Controls.Add(this.addressBtn);
            this.Controls.Add(this.theatresCb);
            this.Controls.Add(this.populateBtn);
            this.Controls.Add(this.disconnectBtn);
            this.Controls.Add(this.connectBtn);
            this.Name = "Form1";
            this.Text = "Приклад роботи з об’єктами";
            ((System.ComponentModel.ISupportInitialize)(this.actorsDgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.photopb)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button connectBtn;
        private System.Windows.Forms.Button disconnectBtn;
        private System.Windows.Forms.Button populateBtn;
        private System.Windows.Forms.ComboBox theatresCb;
        private System.Windows.Forms.Button addressBtn;
        private System.Windows.Forms.ListView playsLv;
        private System.Windows.Forms.RichTextBox scriptRtb;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.DataGridView actorsDgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn actorId;
        private System.Windows.Forms.DataGridViewTextBoxColumn actorName;
        private System.Windows.Forms.ListView rolesLv;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.PictureBox photopb;
        private System.Windows.Forms.ListView aRoleslv;
        private System.Windows.Forms.ColumnHeader columnHeader9;
    }
}

