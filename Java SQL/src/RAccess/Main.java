package RAccess;

import java.awt.EventQueue;
import java.awt.HeadlessException;
import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.Font;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import FlowerShop.Address;
import FlowerShop.Shop;
import com.intersys.jdbc.CachePreparedStatement;
import com.intersys.objects.CacheDatabase;
import com.intersys.objects.CacheException;
import com.intersys.objects.CacheQuery;
import com.intersys.objects.Database;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Vector;
import javax.swing.ListSelectionModel;
import java.awt.Dimension;
import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;
@SuppressWarnings("deprecation")
public class Main {

	private JFrame frame;
	private JTable tShops;
	private JTextField tfName;
	private JTextField tfCity;
	private JTextField tfStreet;
	private JTable tFertilizers;
	private Database db;
	private JTable tPlants;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main window = new Main();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public Main() {
		initialize();
	}
	
	public static DefaultTableModel buildTableModel(ResultSet rs) throws SQLException, IOException {
	    ResultSetMetaData metaData = rs.getMetaData();

	    Vector<String> columnNames = new Vector<String>();
	    int columnCount = metaData.getColumnCount();
	    for (int column = 1; column <= columnCount; column++) {
	        columnNames.add(metaData.getColumnName(column));
	    }

	    Vector<Vector<Object>> data = new Vector<Vector<Object>>();
	    while (rs.next()) {
	        Vector<Object> vector = new Vector<Object>();
	        for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
	            if (columnIndex != 10) {
	            	vector.add(rs.getObject(columnIndex));
	            } else {
	            	InputStream is = rs.getBinaryStream(columnIndex);
	            	byte[] buf = new byte[is.available()];
	            	is.read(buf);
	            	ImageIcon ii = new ImageIcon(buf);	            		            	
	            	Image newimg = ii.getImage().getScaledInstance(100, 100,  java.awt.Image.SCALE_SMOOTH);
	            	ImageIcon newIcon = new ImageIcon(newimg);	            	
	            	vector.add(newIcon);
	            }
	        }
	        data.add(vector);
	    }
	    return new DefaultTableModel(data, columnNames){
	    	private static final long serialVersionUID = -4923117939656075297L;
	    	@Override
	    	public boolean isCellEditable(int row, int col) {
	    		return false;
	    	}
	    };
	    };

	private void initialize() {
		frame = new JFrame();
		frame.getContentPane().setMaximumSize(new Dimension(1005, 485));
		frame.setMaximumSize(new Dimension(1005, 485));
		frame.setTitle("\u041F\u0440\u0438\u043A\u043B\u0430\u0434 \u0432\u0438\u043A\u043E\u0440\u0438\u0441\u0442\u0430\u043D\u043D\u044F \u0440\u0435\u043B\u044F\u0446\u0456\u0439\u043D\u043E\u0433\u043E \u0434\u043E\u0441\u0442\u0443\u043F\u0443");
		frame.setBounds(100, 100, 1005, 485);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton btnConnect = new JButton("\u041F\u0456\u0434\u043A\u043B\u044E\u0447\u0438\u0442\u0438\u0441\u044F");
		btnConnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				String url="jdbc:Cache://localhost:1972/USER";
				String username="_SYSTEM";
				String pwd="SYS";
				try {					
					if ((db == null) || (!db.isOpen())) { 
						db = CacheDatabase.getDatabase(url, username, pwd);
					}
				} catch (CacheException e) {
					JOptionPane.showMessageDialog(null, "Під час підключення до БД виникла помилка.");
					e.printStackTrace();
				}
			}
		});
		btnConnect.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnConnect.setBounds(10, 11, 122, 34);
		frame.getContentPane().add(btnConnect);
		
		JButton btnSelect = new JButton("\u041E\u0442\u0440\u0438\u043C\u0430\u0442\u0438 \u0434\u0430\u043D\u0456");
		btnSelect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String sql = "select FlowerShop.Shop.%ID from FlowerShop.Shop order by Name";
					Iterator<Shop> iter;				
					iter = db.openByQuery(sql);	
					DefaultTableModel dt = new DefaultTableModel(){
						private static final long serialVersionUID = -4923117939656075297L;
			            @Override
			            public boolean isCellEditable(int row, int col) {
			                return false;
			            }
					};
					String[] col = new String[4];
		            col[0] = "ID";
		            col[1] = "Name";
		            col[2] = "City";
		            col[3] = "Street";
		            dt.setColumnIdentifiers(col);
		            String[] row = new String[4];

					while (iter.hasNext()){
						Shop shop = iter.next();
						row[0] = shop.getId().toString();
		                row[1] = shop.getName();
		                if (shop.getAddress() != null){
		                	row[2] = shop.getAddress().getCity();
		                	row[3] = shop.getAddress().getStreet();
		                } else {
		                	row[2] = "";
		                	row[3] = "";
		                }
		                dt.addRow(row);
					}
					tShops.setModel(dt);					
				} catch (CacheException e1) {
					e1.printStackTrace();
				}
			}
		});
		btnSelect.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnSelect.setBounds(142, 11, 133, 34);
		frame.getContentPane().add(btnSelect);
			
		
		JButton btnDisconnect = new JButton("\u0412\u0456\u0434\u043A\u043B\u044E\u0447\u0438\u0442\u0438\u0441\u044F");
		btnDisconnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (!db.isOpen()){
						db.closeAllObjects();
						db.close();
					}
				} catch (CacheException e1) {
					JOptionPane.showMessageDialog(null, "Під час відключення від БД виникла помилка.");
					e1.printStackTrace();
				}				
			}
		});
		btnDisconnect.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnDisconnect.setBounds(285, 11, 122, 34);
		frame.getContentPane().add(btnDisconnect);		
				
		tShops = new JTable();
		tShops.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
		      public void valueChanged(ListSelectionEvent e) {
		          int selectedRow = tShops.getSelectedRow();
		          if (selectedRow < 0) return;
		          tfName.setText((String) tShops.getValueAt(selectedRow, 1));
		          tfCity.setText((String) tShops.getValueAt(selectedRow, 2));
		          tfStreet.setText((String) tShops.getValueAt(selectedRow, 3));
		          
		          try {
		        	  CacheQuery query = new CacheQuery(db, "FlowerShop.Plant", "GetPlantsInShop");						
		        	  java.sql.ResultSet rs = query.execute(tShops.getValueAt(selectedRow, 0));		        	  
		        	  tPlants.setModel(buildTableModel(rs));		        	  
		        	  query.close();
		        	  query = null;
		          } catch (CacheException e1) {
						e1.printStackTrace();
					} catch (SQLException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
						e1.printStackTrace();
					}	
		        }

		      });		
		
		tShops.setFillsViewportHeight(true);
		tShops.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tShops.setBounds(10, 65, 397, 130);
		
		tfName = new JTextField();
		tfName.setFont(new Font("Tahoma", Font.PLAIN, 12));
		tfName.setBounds(526, 65, 200, 28);
		frame.getContentPane().add(tfName);
		tfName.setColumns(10);
		
		tfCity = new JTextField();
		tfCity.setFont(new Font("Tahoma", Font.PLAIN, 12));
		tfCity.setColumns(10);
		tfCity.setBounds(526, 99, 200, 28);
		frame.getContentPane().add(tfCity);
		
		tfStreet = new JTextField();
		tfStreet.setFont(new Font("Tahoma", Font.PLAIN, 12));
		tfStreet.setColumns(10);
		tfStreet.setBounds(526, 133, 200, 28);
		frame.getContentPane().add(tfStreet);
		
		JLabel label = new JLabel("\u041D\u0430\u0437\u0432\u0430 \u043C\u0430\u0433\u0430\u0437\u0438\u043D\u0443:");
		label.setFont(new Font("Tahoma", Font.PLAIN, 12));
		label.setBounds(428, 72, 111, 21);
		frame.getContentPane().add(label);
		
		JLabel label_1 = new JLabel("\u041C\u0456\u0441\u0442\u043E:");
		label_1.setFont(new Font("Tahoma", Font.PLAIN, 12));
		label_1.setBounds(428, 106, 111, 21);
		frame.getContentPane().add(label_1);
		
		JLabel label_2 = new JLabel("\u0412\u0443\u043B\u0438\u0446\u044F:");
		label_2.setFont(new Font("Tahoma", Font.PLAIN, 12));
		label_2.setBounds(428, 140, 111, 21);
		frame.getContentPane().add(label_2);
		
		JButton btnInsert = new JButton("\u0414\u043E\u0434\u0430\u0442\u0438");
		btnInsert.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					db.transactionStart();
					String sql = "insert into FlowerShop.Address(City, Street) values (?, ?)";
					CachePreparedStatement  preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, tfCity.getText()); 
					preparedStatement.setString(2, tfStreet.getText());
					preparedStatement.executeUpdate();
					
					sql = "select FlowerShop.Address.%ID from FlowerShop.Address ORDER BY ID desc";
					Iterator<Address> iter = db.openByQuery(sql);
					Address ad = iter.next();
										
					sql = "insert into FlowerShop.Shop(Name, Address) values (?, ?)";
					preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, tfName.getText()); 
					preparedStatement.setString(2, ad.getId().toString());
					preparedStatement.executeUpdate();

					db.transactionCommit();
				
				} catch (CacheException e1) {				
					try {
						db.transactionRollback();
					} catch (CacheException e2) {
						e2.printStackTrace();
					}
					e1.printStackTrace();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}	
			}
		});
		btnInsert.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnInsert.setBounds(417, 172, 89, 23);
		frame.getContentPane().add(btnInsert);
		
		JButton btnUpdate = new JButton("\u0420\u0435\u0434\u0430\u0433\u0443\u0432\u0430\u0442\u0438");
		btnUpdate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					db.transactionStart();
										
					int selectedRow = tShops.getSelectedRow();
					if (selectedRow < 0) return;
					String sql = "select Address from FlowerShop.Shop where ID = ?";
					CacheQuery query = new CacheQuery(db, sql);		
					Object[] args = {tShops.getValueAt(selectedRow, 0)};
					java.sql.ResultSet rs = query.execute(args);
					if (!rs.next())	return;
						
					sql = "update FlowerShop.Address set City = ?, Street = ? where ID = ?";
					CachePreparedStatement  preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, tfCity.getText()); 
					preparedStatement.setString(2, tfStreet.getText());
					preparedStatement.setString(3, rs.getString(1));
					preparedStatement.executeUpdate();
					
					sql = "update FlowerShop.Shop set Name = ? where ID = ?";
					preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, tfName.getText()); 
					preparedStatement.setString(2, tShops.getValueAt(selectedRow, 0).toString());
					preparedStatement.executeUpdate();				
					
					query.close();
					query = null;
					args = null;										

					db.transactionCommit();				
				} catch (CacheException e1) {				
					try {
						db.transactionRollback();
					} catch (CacheException e2) {
						e2.printStackTrace();
					}
					e1.printStackTrace();
				} catch (HeadlessException e1) {
					e1.printStackTrace();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}	
			}
		});
		btnUpdate.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnUpdate.setBounds(516, 173, 111, 23);
		frame.getContentPane().add(btnUpdate);
		
		JButton btnDelete = new JButton("\u0412\u0438\u0434\u0430\u043B\u0438\u0442\u0438");
		btnDelete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					db.transactionStart();
					int selectedRow = tShops.getSelectedRow();					
					if (selectedRow < 0) return;
					String sql = "select Address from FlowerShop.Shop where ID = ?";
					CacheQuery query = new CacheQuery(db, sql);		
					Object[] args = {tShops.getValueAt(selectedRow, 0)};
					java.sql.ResultSet rs = query.execute(args);
					if (!rs.next())	return;
						
					sql = "delete from FlowerShop.Address where ID = ?";
					CachePreparedStatement  preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, rs.getString(1));
					preparedStatement.executeUpdate();
					
					sql = "delete from FlowerShop.Shop where id = ?";
					preparedStatement = (CachePreparedStatement) db.prepareStatement(sql);
					preparedStatement.setString(1, tShops.getValueAt(selectedRow, 0).toString()); 
					preparedStatement.executeUpdate();
					db.transactionCommit();				
				} catch (CacheException e1) {				
					try {
						db.transactionRollback();
					} catch (CacheException e2) {
						e2.printStackTrace();
					}
					e1.printStackTrace();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}	
			}
		});
		btnDelete.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnDelete.setBounds(637, 173, 89, 23);
		frame.getContentPane().add(btnDelete);
		
		JScrollPane scrollPane = new JScrollPane(tShops);
		scrollPane.setBounds(10, 65, 397, 130);
		frame.getContentPane().add(scrollPane);
		
		JScrollPane scrollPane1 = new JScrollPane();
		scrollPane1.setBounds(10, 206, 969, 230);
		frame.getContentPane().add(scrollPane1);
		
		tPlants = new JTable()
		{
			public Class getColumnClass(int column)
            {
                if (getValueAt(0, column) == null){
                	return String.class;
                }
				if (column != 10) { 
                	return getValueAt(0, column).getClass();
                } else {
                	return ImageIcon.class;
                }
            }
			
			public int getRowHeight(){
				return 100;
			}
		};
		tPlants.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		tPlants.setFillsViewportHeight(true);
		scrollPane1.setViewportView(tPlants);
		
		JScrollPane scrollPane2 = new JScrollPane();
		scrollPane2.setBounds(736, 11, 243, 184);
		frame.getContentPane().add(scrollPane2);
		
		tFertilizers = new JTable();
		tFertilizers.setFillsViewportHeight(true);
		scrollPane2.setViewportView(tFertilizers);
		
		tPlants.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
		      public void valueChanged(ListSelectionEvent e) {
		          int selectedRow = tPlants.getSelectedRow();	
		          if (selectedRow < 0) return;
		          try {
		        	  String sql = "select Fertilizer, element_key from FlowerShop.Plant_Fertilizer where Plant = ?";
		        	  CacheQuery query = new CacheQuery(db, sql);						
		        	  java.sql.ResultSet rs = query.execute(tPlants.getValueAt(selectedRow, 0));		        	  
		        	  tFertilizers.setModel(buildTableModel(rs));		        	  
		        	  query.close();
		        	  query = null;
		          } catch (CacheException e1) {						
						e1.printStackTrace();
					} catch (SQLException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
						e1.printStackTrace();
					}	
		        }
		      });		
	}
}
