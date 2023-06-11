import java.sql.*;
import java.util.*;


public class Student extends User{  
    int age;
    static String[] mathitiss = new String[7];
    int registered_lessons;       
    public Student(String first_name,String last_name,String password,String packet,String email,String user,int age){
        super(first_name,last_name,password,email,packet,user);
        this.age=age;   }
    
    
    
    public static void Studentretrieve(String last_name,String first_name){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
            Statement statement=connection.createStatement();
            String SQL;
            SQL="select username, first_name, last_name, email, age, packet from student where last_name='"+last_name+"' and first_name='"+first_name+"'";
            ResultSet resultSet=statement.executeQuery(SQL);
            ResultSetMetaData rsmd = resultSet.getMetaData();
             int columnsNumber = rsmd.getColumnCount();
            while (resultSet.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
            // if (i > 1) System.out.print(",  ");
                String columnValue = resultSet.getString(i);
                //  System.out.print(columnValue);
                if(i==1) mathitiss[0]=columnValue;
                if(i==2) mathitiss[1]=columnValue;
                if(i==3) mathitiss[2]=columnValue;
                if(i==4) mathitiss[3]=columnValue;
                if(i==5) mathitiss[4]=columnValue;
                if(i==6) mathitiss[5]=columnValue;  
                if(i==7) mathitiss[6]=columnValue;

            }
            }   
        }
        catch (Exception e) {
            e.printStackTrace();
     }
  }
}
