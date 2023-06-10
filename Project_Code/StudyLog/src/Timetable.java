import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Timetable {
    Boolean[][] elefthereia = new Boolean[5][8]; //skeftika to programma ousiastika na einai kathe 1 ora, tha ginetai prota elegxos elefherias
    Integer[][] diathesimo = new Integer[5][8]; //posothtaAtomiko=1, posothtaOmadiko>1
    String[][] mathimat = new String[5][8]; //prota tha ginei o elegxos me ton pano pinaka je ystera
    Integer[][] kostos = new Integer[5][8];
    public Timetable(){
        for(int i=0;i<5;i++){
            for(int j=0;j<8;j++){
                elefthereia[i][j] = false;
            }
        }
    }
/*     public void TimetableFrame() {               //frames arketa kala gia afto pou theloume apo chatgpt
        setTitle("Timetable");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // Set the preferred size of the frame
        setSize(600, 400);

        // Create a panel to hold the timetable
        JPanel timetablePanel = new JPanel();
        timetablePanel.setLayout(new GridLayout(5, 7)); // Example: 5 rows, 7 columns

        // Create an array of text fields for each timetable slot
        JTextField[][] timetableFields = new JTextField[5][7];

        // Populate the timetable panel with text fields
        for (int row = 0; row < 5; row++) {
            for (int col = 0; col < 7; col++) {
                JTextField textField = new JTextField();
                timetableFields[row][col] = textField;
                timetablePanel.add(textField);
            }
        }

        // Create a button to retrieve the data
        JButton getDataButton = new JButton("Get Data");
        getDataButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Retrieve the data from the text fields
                for (int row = 0; row < 5; row++) {
                    for (int col = 0; col < 7; col++) {
                        String data = timetableFields[row][col].getText();
                        System.out.println("Slot [" + row + "][" + col + "]: " + data);
                    }
                }
            }
        });

        // Create a panel to hold the button
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(getDataButton);

        // Create a main panel to hold the timetable panel and button panel
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BorderLayout());
        mainPanel.add(timetablePanel, BorderLayout.CENTER);
        mainPanel.add(buttonPanel, BorderLayout.SOUTH);

        // Add the main panel to the frame
        add(mainPanel);

        setLocationRelativeTo(null); // Center the frame on the screen
    } 
     */
}
