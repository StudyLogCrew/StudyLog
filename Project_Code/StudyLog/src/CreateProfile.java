import java.sql.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
public class CreateProfile {
    
    public static void createProfill(User user){
        int apofasi=SearchProffesor.CheckProfile(user.Username);
        if(apofasi==0){
            System.out.println("You have to create atleast one Profile to continue!(Professor/Student)");  
            Scanner scan = new Scanner(System.in);
            String epilogi=scan.nextLine();
            int votes=0;
            if(epilogi.equals("Professor")){
                System.out.println("Can you please provide as with you're address?");
                String address=scan.nextLine();
                System.out.println("Can you also provide as with you're age?");
                int age=scan.nextInt();
                Teacher prof = new Teacher(user.onoma,user.epitheto,user.password,user.email,user.packet,user.Username,address,votes,age);
                InsertProf( prof);
            }  
            if(epilogi.equals("Student")){
                System.out.println("Can you also provide as with you're age?");
                int age=scan.nextInt();
                Student mathitis= new Student(user.onoma,user.epitheto,user.password,user.email,user.packet,user.Username,age);
                InsertStudent(mathitis);
            }
            scan.close();
        }
        else if(apofasi==1){
                int votes=0;
                Scanner scan = new Scanner(System.in);
                System.out.println("Can you please provide as with you're address?");
                String address=scan.nextLine();
                System.out.println("Can you also provide as with you're age?");
                int age=scan.nextInt();
                Teacher prof = new Teacher(user.onoma,user.epitheto,user.password,user.email,user.packet,user.Username,address,votes,age);
                InsertProf( prof);
                scan.close();
            }  
            
        
        else if(apofasi==2){
            Scanner scan = new Scanner(System.in);
            int age=scan.nextInt();
            Student mathitis= new Student(user.onoma,user.epitheto,user.password,user.email,user.packet,user.Username,age);
            InsertStudent(mathitis);
            scan.close();
        } 
    }




    public static void InsertProf(Teacher prof)
    {
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "lefteris","123");
           Statement statement=connection.createStatement();
           String SQL="INSERT INTO professor ( username, first_name,last_name,email,age,adress,packet,votes) VALUES ("+prof.Username+","+prof.onoma+","+prof.epitheto+","+prof.email+","+prof.age+","+prof.address+","+prof.packet+","+prof.votes+") ";
           int rowsAffected=statement.executeUpdate(SQL);
           if (rowsAffected>0) System.out.println("You're Profile has been created successfully!!");
           else System.out.println("Oops something went wrong !!");
           
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


public static void InsertStudent(Student student)
{
   try {
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "lefteris","123");
       Statement statement=connection.createStatement();
       String SQL="INSERT INTO professor ( username, first_name,last_name,email,age,packet) VALUES ("+student.Username+","+student.onoma+","+student.epitheto+","+student.email+","+student.age+","+student.packet+") ";
       int rowsAffected=statement.executeUpdate(SQL);
       if (rowsAffected>0) System.out.println("You're Profile has been created successfully!!");
       else System.out.println("Oops something went wrong !!");
       
    } catch (Exception e) {
        e.printStackTrace();
    }
}
}


