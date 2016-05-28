package eXTreme;

import java.awt.EventQueue;
import javax.imageio.ImageIO;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JComboBox;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import java.awt.Font;
import javax.swing.JTree;
import javax.swing.JPanel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.GridLayout;
import javax.swing.JTextField;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.MutableTreeNode;
import javax.swing.tree.TreeSelectionModel;
import com.intersys.globals.Connection;
import com.intersys.globals.ConnectionContext;
import com.intersys.globals.GlobalsDirectory;
import com.intersys.globals.GlobalsException;
import com.intersys.globals.NodeReference;
import com.intersys.globals.ValueList;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;
import java.awt.image.BufferedImage;
import javax.swing.ListSelectionModel;

public class Main {

	private JFrame frmExtreme;
	private Connection myConn = null;
	private JTree treeHouses = new JTree();;
	private JTextField textFieldFloat = new JTextField();
	private JTextField textFieldInt = new JTextField();
	private JTextField textFieldString = new JTextField();
	DefaultListModel listModel = new DefaultListModel();
	private JList listTenants = new JList(listModel);
	private JLabel lblMapImage = new JLabel("");

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main window = new Main();
					window.frmExtreme.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Main() {
		initialize();
	}
	
	private void addNodes(NodeReference aNodeRef, String aBaseName, MutableTreeNode aTreeNode)
	{
		try
        {
			aNodeRef.appendSubscript("");
            String subscr = aNodeRef.nextSubscript();
            String modifier = "".toString();
            while (!subscr.equals(""))
            {
                aNodeRef.setSubscript(aNodeRef.getSubscriptCount(), subscr);
                if (aNodeRef.getSubscriptCount() == 2) {modifier = "буд. ".toString();}
                else if (aNodeRef.getSubscriptCount() == 3) {modifier = "під’їзд ".toString();}
                else if (aNodeRef.getSubscriptCount() == 4) {modifier = "поверх ".toString();}
                else if (aNodeRef.getSubscriptCount() == 5) {modifier = "кв. ".toString();}                
                DefaultMutableTreeNode treeNode = new DefaultMutableTreeNode(modifier.concat(subscr));
                if (aNodeRef.hasData())
                {                	
                	if (aTreeNode == null)
                    {
                    	DefaultTreeModel model = (DefaultTreeModel) treeHouses.getModel();
                    	DefaultMutableTreeNode root = (DefaultMutableTreeNode) model.getRoot();
                    	model.insertNodeInto(treeNode, root, root.getChildCount());
                    }
                    else
                    {
                    	DefaultTreeModel model = (DefaultTreeModel) treeHouses.getModel();                    	
                    	model.insertNodeInto(treeNode, aTreeNode, aTreeNode.getChildCount());
                    }
                }
                if (aNodeRef.hasSubnodes())
                {
                    addNodes(aNodeRef, subscr, treeNode);
                }
                subscr = aNodeRef.nextSubscript();
            }
        }
        catch (GlobalsException ex)
        {
        	JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        finally
        {
          aNodeRef.setSubscriptCount(aNodeRef.getSubscriptCount()-1);
        }

	}
	
	private void showData(NodeReference aNodeRef) {
		Object data = aNodeRef.getObject();
		if (data instanceof String)
        {
            if (aNodeRef.getSubscriptCount() == 3)
            {
            	textFieldString.setText(data.toString());
            }
            else
                if (aNodeRef.getSubscriptCount() == 5)
                {
                    ValueList outList = aNodeRef.getList();
                    outList.resetToFirst();
                    listModel.clear();                    
                    for (int i = 0; i < outList.length(); i++)
                    {                                
                    	listModel.addElement(outList.getNextObject());
                    }
                    outList.close();
                }
                else
                    if (aNodeRef.getSubscriptCount() == 1)
                    {                    	
                    	lblMapImage.setIcon(new ImageIcon(aNodeRef.getBytes()));
                    }
        }
        else if (data instanceof Double)
        {
        	textFieldFloat.setText(data.toString());
        }
        else if (data instanceof Integer)
        {
        	textFieldInt.setText(data.toString());
        }
		
	}

	/**
	 * Initialize the contents of the frame.
	 */	
	private void initialize() {		
		frmExtreme = new JFrame();
		frmExtreme.setResizable(false);
		frmExtreme.setTitle("\u041F\u0440\u0438\u043A\u043B\u0430\u0434 \u0440\u043E\u0431\u043E\u0442\u0438 eXTreme ");
		frmExtreme.setBounds(100, 100, 766, 443);
		frmExtreme.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmExtreme.getContentPane().setLayout(null);
		
		JButton btnConnect = new JButton("Connect");
		btnConnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				myConn = ConnectionContext.getConnection();
			    try {
			      if (!myConn.isConnected())
			    	 myConn.connect("User", "_SYSTEM", "SYS");			      
			      JOptionPane.showMessageDialog(null, "З’єднання з БД виконано!");    
			    }
			    catch (GlobalsException ex) { JOptionPane.showMessageDialog(null, ex.getMessage()); }			   
			}
		});
		
		JPanel panel = new JPanel();
		panel.setBounds(477, 316, 273, 91);
		frmExtreme.getContentPane().add(panel);
		panel.setLayout(null);
		listTenants.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		listTenants.setFont(new Font("Tahoma", Font.PLAIN, 13));
		listTenants.setBounds(0, 0, 273, 91);
		panel.add(listTenants);
		
		listTenants.setValueIsAdjusting(true);
		listTenants.setVisibleRowCount(4);
		btnConnect.setFont(new Font("Tahoma", Font.PLAIN, 13));
		btnConnect.setBounds(0, 11, 144, 33);
		frmExtreme.getContentPane().add(btnConnect);
		
		JButton btnShowGlobals = new JButton("List Globals");		
		btnShowGlobals.setFont(new Font("Tahoma", Font.PLAIN, 13));
		btnShowGlobals.setBounds(154, 11, 144, 33);
		frmExtreme.getContentPane().add(btnShowGlobals);
		
		JButton btnCreateGlobal = new JButton("Create Global");		
		btnCreateGlobal.setFont(new Font("Tahoma", Font.PLAIN, 13));
		btnCreateGlobal.setBounds(308, 11, 144, 33);
		frmExtreme.getContentPane().add(btnCreateGlobal);
		
		JButton btnShowGlobal = new JButton("Show global");			
		btnShowGlobal.setFont(new Font("Tahoma", Font.PLAIN, 13));
		btnShowGlobal.setBounds(462, 11, 144, 33);
		frmExtreme.getContentPane().add(btnShowGlobal);
		
		JButton btnDisconnect = new JButton("Disconnect");
		btnDisconnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (myConn != null && myConn.isConnected())
	                myConn.close();
			}
		});
		btnDisconnect.setFont(new Font("Tahoma", Font.PLAIN, 13));
		btnDisconnect.setBounds(616, 11, 144, 33);
		frmExtreme.getContentPane().add(btnDisconnect);
		
		JLabel lblGlobals = new JLabel("\u041F\u0435\u0440\u0435\u043Bi\u043A \u0433\u043B\u043E\u0431\u0430\u043Bi\u0432 \u0443 \u043F\u0440\u043E\u0441\u0442\u043E\u0440i i\u043C\u0435\u043D USER");
		lblGlobals.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblGlobals.setBounds(10, 68, 230, 28);
		frmExtreme.getContentPane().add(lblGlobals);
		
		JComboBox<String> comboBox = new JComboBox<String>();
		comboBox.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent evt) {
				NodeReference nodeRef = null;				
			    Object item = evt.getItem();
			    if (evt.getStateChange() == ItemEvent.SELECTED) {			      
		            try
		            {   
		                nodeRef = myConn.createNodeReference(item.toString());
		                if (nodeRef.hasData() || nodeRef.hasSubnodes())
		                {
		                	int n = JOptionPane.showOptionDialog(null, "Ви бажаєте видалити існуючий глобал?", "Globals Test", 
		                			                             JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, null, null);
		                	if (n == JOptionPane.YES_OPTION)
		                    {
		                        nodeRef.kill();
		                    }
		                }
		            }
		            catch (Exception ex)
		            {
		            	JOptionPane.showMessageDialog(null, ex.getMessage());
		            }
		            finally
		            {
		                if (nodeRef != null)
		                    nodeRef.close();
		            }
			    }			    
			}
		});
		comboBox.setEditable(true);
		comboBox.setFont(new Font("Tahoma", Font.PLAIN, 13));
		comboBox.setBounds(271, 73, 335, 20);
		comboBox.setEditable(false);
		frmExtreme.getContentPane().add(comboBox);
		
		JLabel lblIndexes = new JLabel("\u0414\u0435\u0440\u0435\u0432\u043E i\u043D\u0434\u0435\u043A\u0441i\u0432");
		lblIndexes.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblIndexes.setBounds(10, 107, 220, 28);
		frmExtreme.getContentPane().add(lblIndexes);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 136, 248, 157);
		frmExtreme.getContentPane().add(scrollPane);
				
		scrollPane.setViewportView(treeHouses);
		treeHouses.setModel(new DefaultTreeModel(
			new DefaultMutableTreeNode("Houses") {
				{
				}
			}
		));
		treeHouses.setShowsRootHandles(true);
		treeHouses.setFont(new Font("Tahoma", Font.PLAIN, 13));
		treeHouses.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);
		
		JLabel lblMap = new JLabel("\u041A\u0430\u0440\u0442\u0430 \u0432\u0443\u043B\u0438\u0446i");
		lblMap.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblMap.setBounds(281, 107, 200, 28);
		frmExtreme.getContentPane().add(lblMap);
		
		JPanel panelPic = new JPanel();
		panelPic.setBounds(281, 136, 479, 157);
		frmExtreme.getContentPane().add(panelPic);
		panelPic.setLayout(new GridLayout(0, 1, 0, 0));
		
		panelPic.add(lblMapImage);
		
		JLabel lblNewLabel = new JLabel("\u0417\u0430\u0433\u0430\u043B\u044C\u043D\u043E\u0431\u0443\u0434\u0438\u043D\u043A\u043E\u0432i \u043F\u043E\u0442\u0440\u0435\u0431\u0438");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblNewLabel.setBounds(10, 312, 200, 28);
		frmExtreme.getContentPane().add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("\u0414\u0430\u0442\u0430 \u043F\u0440\u0438\u0439\u043E\u043C\u0443 \u043A\u0432\u0430\u0440\u0442\u0438\u0440 \u043C\u0435\u0448\u043A\u0430\u043D\u0446\u044F\u043C\u0438");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblNewLabel_1.setBounds(10, 346, 250, 28);
		frmExtreme.getContentPane().add(lblNewLabel_1);
		
		JLabel lbli = new JLabel("\u041Ai\u043B\u044C\u043A\u0456\u0441\u0442\u044C \u043F\u0440\u043E\u0434\u0430\u043D\u0438\u0445 \u043A\u0432\u0430\u0440\u0442\u0438\u0440");
		lbli.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lbli.setBounds(10, 379, 200, 28);
		frmExtreme.getContentPane().add(lbli);
				
		textFieldFloat.setEditable(false);
		textFieldFloat.setFont(new Font("Tahoma", Font.PLAIN, 13));
		textFieldFloat.setBounds(235, 316, 104, 20);
		frmExtreme.getContentPane().add(textFieldFloat);
		textFieldFloat.setColumns(10);
		
		textFieldString.setEditable(false);
		textFieldString.setBounds(235, 351, 104, 20);
		frmExtreme.getContentPane().add(textFieldString);
		textFieldString.setColumns(10);
		
		textFieldInt.setEditable(false);
		textFieldInt.setBounds(235, 385, 104, 20);
		frmExtreme.getContentPane().add(textFieldInt);
		textFieldInt.setColumns(10);
		
		JLabel lblii = new JLabel("\u041F\u0435\u0440\u0435\u043Bi\u043A \u043C\u0435\u0448\u043A\u0430\u043D\u0446i\u0432");
		lblii.setFont(new Font("Tahoma", Font.PLAIN, 13));
		lblii.setBounds(357, 312, 120, 28);
		frmExtreme.getContentPane().add(lblii);
		
		btnShowGlobals.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				GlobalsDirectory globDir = null;
	            try
	            {
	                globDir = myConn.createGlobalsDirectory();
	                comboBox.removeAllItems();
	                String globName = "Houses";
	                while (!globName.equals(""))
	                {
	                	comboBox.addItem(globName);
	                    globName = globDir.nextGlobalName();
	                }
	            }
	            catch (Exception ex)
	            {
	            	JOptionPane.showMessageDialog(null, ex.getMessage());
	            }
	            finally
	            {
	                if (globDir != null)
	                   globDir.close();
	            }

			}
		});
		
		treeHouses.addTreeSelectionListener(new TreeSelectionListener() {
		    public void valueChanged(TreeSelectionEvent e) {	
		    	NodeReference nodeRef = null;
		    	try
		    	{
			    	nodeRef = myConn.createNodeReference(comboBox.getSelectedItem().toString());
			    	for (int i=1; i<e.getNewLeadSelectionPath().getPathCount(); i++)
			    	{	
			    		String subscr = e.getNewLeadSelectionPath().getPathComponent(i).toString();
			    		if (i == 2) {subscr = e.getNewLeadSelectionPath().getPathComponent(i).toString().substring(5);}
			    		else if (i == 3) {subscr = e.getNewLeadSelectionPath().getPathComponent(i).toString().substring(8);}
			    		else if (i == 4) {subscr = e.getNewLeadSelectionPath().getPathComponent(i).toString().substring(7);}
			    		else if (i == 5) {subscr = e.getNewLeadSelectionPath().getPathComponent(i).toString().substring(4);}
			    		
			    		nodeRef.appendSubscript(subscr);
			    		showData(nodeRef);
		            }
		    	}
	            catch (Exception ex)
	            {
	            	JOptionPane.showMessageDialog(null, ex.getMessage());
	            }
	            finally
	            {
	                if (nodeRef != null)
	                    nodeRef.close();
	            }
	        }		    
		});
		
		btnCreateGlobal.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				NodeReference nodeRef = null;
				BufferedImage image = null;
				ByteArrayOutputStream baos = null;
				
				try
	            {
	                nodeRef = myConn.createNodeReference(comboBox.getSelectedItem().toString());

	                //побудова віртуального дерева індексів
	                nodeRef.appendSubscript("проспект Перемоги");
	                
	                image = ImageIO.read(new File("D:\\Workspace\\eXTreme\\pics\\Peremogy.png"));	 
	                baos = new ByteArrayOutputStream();
	                ImageIO.write(image, "png", baos); 
	                nodeRef.set(baos.toByteArray());
	                
	                nodeRef.appendSubscript("66-Д");
	                nodeRef.set(85478.54);
	                
	                nodeRef.appendSubscript(1);
	                nodeRef.set("12/05/2013");
	                
	                nodeRef.appendSubscript(2);
	                nodeRef.set(3);
	                
	                nodeRef.appendSubscript(6);
	                ValueList myList = myConn.createList();
	                myList.append("Сідоров В. П.", "Сідорова А. М.", "Сідорова І. В.");
	                nodeRef.set(myList);
	                myList.close();
	                
	                nodeRef.setSubscriptCount(4);
	                nodeRef.appendSubscript(7);
	                myList = myConn.createList();
	                myList.append("Морозова К. А.", "Морозова О. А.");
	                nodeRef.set(myList);
	                myList.close();
	               
	                nodeRef.setSubscriptCount(4);
	                nodeRef.appendSubscript(9);
	                myList = myConn.createList();
	                myList.append("Петров К. А.", "Петров А. А.");
	                nodeRef.set(myList);
	                myList.close();
	                		 
	                nodeRef.setSubscriptCount(3);	
	                nodeRef.appendSubscript(5);
	                nodeRef.set(1);
	                
	                nodeRef.appendSubscript(21);
	                myList = myConn.createList();
	                myList.append("Мартинюк К. К.", "Мартинюк А. М.", "Мартинюк М. К.");
	                nodeRef.set(myList);
	                myList.close();
	                
	                //безпосереднє завдання рівня ієрархії дерева, на якому будуть створюватися нові вузли
	                nodeRef.setSubscriptCount(3);
	                nodeRef.setSubscript(3, 3);
	                nodeRef.set("12/15/2013");
	                
	                nodeRef.setSubscript(4, 3);
	                nodeRef.set(1);
	                
	                nodeRef.setSubscript(5, 103);
	                myList = myConn.createList();
	                myList.append("Іванов А. Л.", "Іванова А. Л.");
	                nodeRef.set(myList);
	                myList.close();
	                
	                nodeRef.setSubscriptCount(3);
	                nodeRef.setSubscript(4, 8);
	                nodeRef.set(2);
	                
	                nodeRef.setSubscript(5, 128);
	                myList = myConn.createList();
	                myList.append("Круглик П. В.");
	                nodeRef.set(myList);
	                myList.close();
	                
	                nodeRef.setSubscript(5, 129);
	                myList = myConn.createList();
	                myList.append("Руденко А. В.", "Руденко Х. П.", "Руденко А. А.", "Руденко У. А.");
	                nodeRef.set(myList);
	                myList.close();
	                
	  			    //безпосереднє додавання значень без зміни положення поточного елементу                
	                nodeRef.setSubscriptCount(0);

	                image = ImageIO.read(new File("D:\\Workspace\\eXTreme\\pics\\Brovarskyi.png")); 
	                baos = new ByteArrayOutputStream();
	                ImageIO.write(image, "png", baos); 
	                nodeRef.set(baos.toByteArray(), "проспект Броварський");
	                	                
	                nodeRef.set(5496.94, "проспект Броварський", "27");
	                nodeRef.set("09/08/2012", "проспект Броварський", "27", 1);
	                nodeRef.set(1, "проспект Броварський", "27", 1, 1);
	                
	                myList = myConn.createList();
	                myList.append("Куценко Є. В.");
	                nodeRef.set(myList, "проспект Броварський", "27", 1, 1, 1);
	                myList.close();
	                
	                nodeRef.set(1, "проспект Броварський", "27", 1, 2);
	                
	                myList = myConn.createList();
	                myList.append("Рябко І. К.");
	                nodeRef.set(myList, "проспект Броварський", "27", 1, 2, 7);
	                myList.close();	                
	            }
	            catch (Exception ex)
	            {
	            	JOptionPane.showMessageDialog(null, ex.getMessage());
	            }
	            finally
	            {
	                if (nodeRef != null) nodeRef.close();
	            }

			}
		});
		
		btnShowGlobal.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {				
				NodeReference nodeRef = null;
	            try
	            {
	                nodeRef = myConn.createNodeReference(comboBox.getSelectedItem().toString());
	                addNodes(nodeRef, "", null);
	            }
	            catch (Exception ex)
	            {
	            	JOptionPane.showMessageDialog(null, ex.getMessage());
	            }
	            finally
	            {
	                if (nodeRef != null)
	                    nodeRef.close();
	            }

			}
		});
	}
}
