package OAccess;

import java.awt.EventQueue;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JButton;
import Parking.Car;
import Parking.Garage;
import Parking.Person;
import com.intersys.classes.RelationshipObject;
import com.intersys.objects.CacheDatabase;
import com.intersys.objects.CacheException;
import com.intersys.objects.Database;
import com.intersys.objects.Id;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JPanel;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import java.awt.GridLayout;
import java.awt.Image;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;

@SuppressWarnings("deprecation")
public class Main {

	private JFrame frame;
	private Database db;
	private JTextField tfName;	
	private JTable tGarages;
	private JTable tCars;
	private JTable tContacts;
	private boolean nameChanged;
	
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

	private void initialize() {
		frame = new JFrame();
		frame.setTitle("\u041F\u0440\u0438\u043A\u043B\u0430\u0434 \u0432\u0438\u043A\u043E\u0440\u0438\u0441\u0442\u0430\u043D\u043D\u044F \u043E\u0431\u2019\u0454\u043A\u0442\u043D\u043E\u0433\u043E \u0434\u043E\u0441\u0442\u0443\u043F\u0443");
		frame.setBounds(100, 100, 875, 370);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JButton button = new JButton("\u041F\u0456\u0434\u043A\u043B\u044E\u0447\u0438\u0442\u0438\u0441\u044F");
		button.addActionListener(new ActionListener() {			
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
		button.setFont(new Font("Tahoma", Font.PLAIN, 12));
		button.setBounds(10, 11, 122, 34);
		frame.getContentPane().add(button);
		
		JButton button_1 = new JButton("\u041E\u0442\u0440\u0438\u043C\u0430\u0442\u0438 \u0434\u0430\u043D\u0456");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Iterator<Garage> iter = db.openByQuery("Parking.Garage", "");	
					DefaultTableModel dt = new DefaultTableModel(){
						private static final long serialVersionUID = -4923117939656075297L;
			            @Override
			            public boolean isCellEditable(int row, int col) {
			                return false;
			            }
					};
					String[] col = new String[5];
		            col[0] = "ID";
		            col[1] = "Address";
		            col[2] = "OwnerID";
		            col[3] = "Owner";
		            col[4] = "Places";
		            dt.setColumnIdentifiers(col);
		            String[] row = new String[5];

					while (iter.hasNext()){
						Garage g = iter.next();
						row[0] = g.getId().toString();
						row[1] = g.getAddress().getCity()+" "+g.getAddress().getStreet();
						row[2] = g.getOwner().getId().toString();
		                row[3] = g.getOwner().getName();
		                row[4] = g.getPlaces().toString();
		                dt.addRow(row);
					}
					tGarages.setModel(dt);	
					tGarages.getColumnModel().getColumn(2).setMinWidth(0);
					tGarages.getColumnModel().getColumn(2).setMaxWidth(0);
				} catch (CacheException e1) {
					e1.printStackTrace();
				}
			}
		});
		button_1.setFont(new Font("Tahoma", Font.PLAIN, 12));
		button_1.setBounds(142, 11, 133, 34);
		frame.getContentPane().add(button_1);
		
		JButton button_2 = new JButton("\u0412\u0456\u0434\u043A\u043B\u044E\u0447\u0438\u0442\u0438\u0441\u044F");
		button_2.addActionListener(new ActionListener() {
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
		button_2.setFont(new Font("Tahoma", Font.PLAIN, 12));
		button_2.setBounds(285, 11, 122, 34);
		frame.getContentPane().add(button_2);
		
		tfName = new JTextField();
		tfName.addFocusListener(new FocusAdapter() {
			@Override
			public void focusLost(FocusEvent arg0) {
				if (nameChanged)
				{
					try {
						int selectedRow = tGarages.getSelectedRow();
						if (selectedRow < 0) return;			        
						Person p = (Person) Person._open(db, new Id(tGarages.getValueAt(selectedRow, 2).toString()));
						p.setName(tfName.getText());
						p._save();
						nameChanged = false;
					} catch (CacheException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
				}
			}
		});
		tfName.setBounds(603, 53, 246, 20);
		frame.getContentPane().add(tfName);
		tfName.setColumns(10);
		tfName.getDocument().addDocumentListener(new DocumentListener() {
			@Override
			public void changedUpdate(DocumentEvent arg0) {
			}

			@Override
			public void insertUpdate(DocumentEvent e) {				
				nameChanged = true;
			}

			@Override
			public void removeUpdate(DocumentEvent e) {			
			}		    
		});
		
		JLabel label = new JLabel("\u0406\u043C\u2019\u044F \u0432\u043B\u0430\u0441\u043D\u0438\u043A\u0430:");
		label.setFont(new Font("Tahoma", Font.PLAIN, 12));
		label.setBounds(484, 52, 116, 20);
		frame.getContentPane().add(label);
		
		JLabel label_1 = new JLabel("\u041A\u043E\u043D\u0442\u0430\u043A\u0442\u0438 \u0432\u043B\u0430\u0441\u043D\u0438\u043A\u0430:");
		label_1.setFont(new Font("Tahoma", Font.PLAIN, 12));
		label_1.setBounds(484, 83, 116, 20);
		frame.getContentPane().add(label_1);
		
		JPanel panel = new JPanel();
		panel.setBounds(613, 172, 236, 154);
		frame.getContentPane().add(panel);
		panel.setLayout(new GridLayout(0, 1, 0, 0));
		
		JLabel lPhoto = new JLabel("");
		panel.add(lPhoto);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 53, 464, 108);
		frame.getContentPane().add(scrollPane);
		
		JTextArea taLog = new JTextArea();		
		taLog.setLineWrap(true);
  	  	taLog.setEditable(false);		
		
		tGarages = new JTable();
		tGarages.setFillsViewportHeight(true);
		scrollPane.setViewportView(tGarages);	
		tGarages.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
		      public void valueChanged(ListSelectionEvent e) {
		          int selectedRow = tGarages.getSelectedRow();
		          if (selectedRow < 0) return;
		          try {
		        	  taLog.setText("");
		        	  Garage g = (Garage) Garage._open(db, new Id(tGarages.getValueAt(selectedRow, 0).toString()));
		        	  
		        	  BufferedReader br = new BufferedReader(g.getLogIn());
		        	  taLog.read( br, null );
	                  br.close();
		        	  g.getLogIn().close();  
		        	  		        	  
		        	  DefaultTableModel dt = new DefaultTableModel(){
							private static final long serialVersionUID = -4923117939656075297L;
				            @Override
				            public boolean isCellEditable(int row, int col) {
				                return false;
				            }
						};
						String[] col = new String[3];
						col[0] = "Number";
			            col[1] = "Owner";
			            col[2] = "Dimensions";
			            dt.setColumnIdentifiers(col);			            
						
		        	  RelationshipObject cars = g.getCars();
		        	  String[] row = new String[3];
		        	  for (int i = 1; i<=cars._count(); i++)
		        	  {
		        		  Car c = (Car)cars.get(i);
		        		  row[0] = c.getId().toString();
		        		  row[1] = c.getOwner().getName();
						  row[2] = c.getDimensions().get(0)+"x"+c.getDimensions().get(1);
			              dt.addRow(row);		        		  
		        	  }
		        	  tCars.setModel(dt);
		        	  
		        	  tfName.setText(g.getOwner().getName());		        	  
		        	  
		        	  dt = new DefaultTableModel(){
							private static final long serialVersionUID = -4923117939656075297L;
				            @Override
				            public boolean isCellEditable(int row, int col) {
				               return false;				               
				            }
						};		
		        	  col = new String[2];
		        	  col[0] = "Number";
			          col[1] = "Owner";
			          dt.setColumnIdentifiers(col);
		        	  Map<String, String> contacts = g.getOwner().getContacts();		        	  
		        	  row = new String[2];
		        	  for (Map.Entry<String, String> entry : contacts.entrySet()) {
		        		  	row[0] = entry.getKey();
				        	row[1] = entry.getValue();						  
					        dt.addRow(row);  
		        		}
		        	  tContacts.setModel(dt);		        	  
		          } catch (CacheException e1) {
						e1.printStackTrace();						
		        } catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		      }
		      });		
		
		JScrollPane scrollPane_1 = new JScrollPane();
		scrollPane_1.setBounds(283, 174, 320, 155);
		frame.getContentPane().add(scrollPane_1);
		
		tCars = new JTable();
		tCars.setFillsViewportHeight(true);
		scrollPane_1.setViewportView(tCars);
		tCars.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
		      public void valueChanged(ListSelectionEvent e) {
		          int selectedRow = tCars.getSelectedRow();
		          if (selectedRow < 0) return;
		          try {		        	  
		        	  Car c = (Car) Car._open(db, new Id(tCars.getValueAt(selectedRow, 0).toString()));		        	  
		        	  byte[] buf = new byte[c.getPhotoIn().available()];
		        	  c.getPhotoIn().read(buf);
		        	  ImageIcon ii = new ImageIcon(buf);	            		            	
		        	  Image newimg = ii.getImage().getScaledInstance(236, 154,  java.awt.Image.SCALE_SMOOTH);
		        	  ImageIcon newIcon = new ImageIcon(newimg);	      
		        	  lPhoto.setIcon(newIcon);		        	  
		        	  c.getPhotoIn().close();
		          } catch (CacheException e1) {
						e1.printStackTrace();						
		        } catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		      }
		      });		
		
		JScrollPane scrollPane_2 = new JScrollPane();
		scrollPane_2.setBounds(10, 174, 263, 153);
		frame.getContentPane().add(scrollPane_2);
		scrollPane_2.setViewportView(taLog);
		
		JScrollPane scrollPane_3 = new JScrollPane();
		scrollPane_3.setBounds(603, 84, 246, 77);
		frame.getContentPane().add(scrollPane_3);
		
		tContacts = new JTable();
		scrollPane_3.setViewportView(tContacts);
		tContacts.setFillsViewportHeight(true);
	}
}
