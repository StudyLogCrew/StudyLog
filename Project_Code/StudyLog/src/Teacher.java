import java.util.ArrayList;
import java.sql.*;
import java.util.*;


public class Teacher extends User{
    public static String[] kathigiti= new String[9];
    String address;
    int votes;
    int age;
    public String[][] TimeTable;
    public Teacher(String first_name,String last_name,String password,String packet,String email,String user,String address,int votes,int age){
      super(first_name,last_name,password,email,packet,user);  
      this.age=age;
      this.address=address;
      this.votes=votes;

    }

    public static void Teacherretrieve(String last_name,String first_name){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
            Statement statement=connection.createStatement();
            String SQL;
            SQL="select username, first_name, last_name, email, age, address, packet, votes from student where last_name="+last_name+" and first_name="+first_name+"";
            ResultSet resultSet=statement.executeQuery(SQL);
            ResultSetMetaData rsmd = resultSet.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while (resultSet.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
            // if (i > 1) System.out.print(",  ");
                String columnValue = resultSet.getString(i);
                //  System.out.print(columnValue);
                if(i==1) kathigiti[0]=columnValue;
                if(i==2) kathigiti[1]=columnValue;
                if(i==3) kathigiti[2]=columnValue;
                if(i==4) kathigiti[3]=columnValue;
                if(i==5) kathigiti[4]=columnValue;
                if(i==6) kathigiti[5]=columnValue;  
                if(i==7) kathigiti[6]=columnValue;
                if(i==8) kathigiti[7]=columnValue;
            }
            }   
        }
        catch (Exception e) {
            e.printStackTrace();
     }   
    } 

}
