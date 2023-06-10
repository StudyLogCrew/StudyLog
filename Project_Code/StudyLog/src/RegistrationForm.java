import java.sql.*;
import java.sql.Connection;
import java.sql.Statement;


public class RegistrationForm {
    String onoma;
    String epitheto;
    String password;
    String email;
    String Username;
    String packet;
    public RegistrationForm(String name,String Last_name,String pass,String email,String packet,String user){
        this.onoma=name;
        this.epitheto=Last_name;
        this.password=pass;
        this.email=email;
        this.packet=packet;
        this.Username=user;
    }
    public void CreateAcc()
    {
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "lefteris","123");
           Statement statement=connection.createStatement();
           String SQL="INSERT INTO user (username, first_name, last_name, email, packet, passwordd) VALUES("+this.Username+","+this.onoma+","+this.epitheto+","+this.email+","+this.packet+","+this.password+")";
           int rowsAffected=statement.executeUpdate(SQL);
           if (rowsAffected>0) System.out.println("You have successfully created you're account!");
           else System.out.println("Oops something went wrong with you're account!");
           
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




}