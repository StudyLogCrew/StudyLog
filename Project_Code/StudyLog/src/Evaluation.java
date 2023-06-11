import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;


public class Evaluation {
    int upvotes;
    String username;
    
    public Evaluation(String user,int a )
    {
        this.upvotes=a;
        this.username=user;
    }

    public void GiveReview()
    {
       try {
           Scanner scan= new Scanner(System.in);
           System.out.println("Give you're review!");
           String review=scan.nextLine();
           scan.close();
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
           Statement statement=connection.createStatement();
           String SQL="INSERT INTO evaluations ( username, eval) VALUES ("+this.username+","+review+") ";
           int rowsAffected=statement.executeUpdate(SQL);
           if (rowsAffected>0) System.out.println("Thank you for you're review!");
           else System.out.println("Oops something went wrong with you're review!");
           
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    // public void ReviewFrame() {                              //frames
    //     setTitle("Review System");
    //     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
    //     // Create a panel to hold the components
    //     JPanel panel = new JPanel();
    //     panel.setLayout(new BorderLayout());

    //     // Create a button for upvoting
    //     JButton upvoteButton = new JButton("Upvote");
    //     upvoteButton.addActionListener(new ActionListener() {
    //         @Override
    //         public void actionPerformed(ActionEvent e) {
    //             upvotes++;
    //             updateCountLabel();
    //         }
    //     });
    //     panel.add(upvoteButton, BorderLayout.NORTH);

    //     // Create a text area for writing reviews
    //     JTextArea reviewTextArea = new JTextArea();
    //     reviewTextArea.setLineWrap(true);
    //     JScrollPane scrollPane = new JScrollPane(reviewTextArea);
    //     panel.add(scrollPane, BorderLayout.CENTER);

    //     // Create a button for submitting the review
    //     JButton submitButton = new JButton("Submit");
    //     submitButton.addActionListener(new ActionListener() {
    //         @Override
    //         public void actionPerformed(ActionEvent e) {
    //             String review = reviewTextArea.getText();
    //             reviews.add(review);
    //             reviewTextArea.setText("");
    //             System.out.println("Review submitted: " + review);
    //         }
    //     });
    //     panel.add(submitButton, BorderLayout.SOUTH);

    //     // Create a label to display the upvote count
    //     countLabel = new JLabel("Upvotes: 0");
    //     panel.add(countLabel, BorderLayout.WEST);

    //     // Add the panel to the frame
    //     add(panel);

    //     pack(); // Adjusts the frame size to fit the components
    //     setLocationRelativeTo(null); // Center the frame on the screen
    // }

    // private void updateCountLabel() {
    //     countLabel.setText("Upvotes: " + upvotes);
    // }
}