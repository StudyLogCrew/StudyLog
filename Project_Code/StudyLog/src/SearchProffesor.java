import java.sql.*;
import java.util.*;

public class SearchProffesor {
 static String name[] = new String[2];
 static String lesson_name[][] = new String[10][2];
 static String xristis[]= new String[6];
 static String diplo;
 
  public static void SearchName()
 {
    Scanner scan= new Scanner(System.in);
    System.out.println("Proffesor first name: ");
    String first_name=scan.nextLine();
    System.out.println("Proffesor last name: ");
    String last_name=scan.nextLine();
    scan.close();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
        Statement statement=connection.createStatement();
        String SQL;
        if(first_name.isEmpty()){
        SQL="select first_name,last_name,email from professor where last_name='"+last_name+"'" ;}
        else{
        SQL="select first_name,last_name,email from professor where last_name='"+last_name+" and first_name="+first_name+"'" ;    
        }
        ResultSet resultSet=statement.executeQuery(SQL);
        ResultSetMetaData rsmd = resultSet.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (resultSet.next()) {
          for (int i = 1; i <= columnsNumber; i++) {
           // if (i > 1) System.out.print(",  ");
              String columnValue = resultSet.getString(i);
            //  System.out.print(columnValue);
            if(i==1) name[0]=columnValue;
            if(i==2) name[1]=columnValue;
            if(i==3) name[2]=columnValue;
            }
          }
        
    }
        
    catch (Exception e) {
         e.printStackTrace();
     }
 }
  public static void SearchLesson()
  {
    int j=0;
    Scanner scan= new Scanner(System.in);
    System.out.println("Type the lesson: ");
    String lesson=scan.nextLine();
    scan.close();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
        Statement statement=connection.createStatement();
        String SQL;
        SQL="SELECT professor.first_name, professor.last_name, professor.packet,proffesor.votes FROM professor INNER JOIN profs_subjects ON profs_subjects.username = professor.username WHERE profs_subjects.subject_name ='" +lesson+"'";
        ResultSet resultSet=statement.executeQuery(SQL);
        ResultSetMetaData rsmd = resultSet.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (resultSet.next()) {   
          for (int i = 1; i <= columnsNumber; i++) {
           // if (i > 1) System.out.print(",  ");
              String columnValue = resultSet.getString(i);
            //  System.out.print(columnValue);
            if(i==1)  lesson_name[j][0]=columnValue;
            if(i==2)  lesson_name[j][1]=columnValue;
            if(i==3)  lesson_name[j][2]=columnValue;//packet
            if(i==4)  lesson_name[j][3]=columnValue;//votes
            }
            j=j+1;
}
        
     } catch (Exception e) {
         e.printStackTrace();
     }
  }
  public static void CorrectArray()
  {
    
    for(int j=0; j <= lesson_name.length; j++  )
    {
        if(lesson_name[j][2].equals("golden"))
        {
         lesson_name[j][2]="2";
        }
        if(lesson_name[j][2].equals("silver"))
        {
         lesson_name[j][2]="1";
        }
        if(lesson_name[j][2].equals("no_packet"))
        {
         lesson_name[j][2]="0";
        }
    }
    for (int j = 1; j < lesson_name.length; j++) {
        int tempo = j;
        while (tempo > 0 && Integer.parseInt(lesson_name[tempo][0]) > Integer.parseInt(lesson_name[tempo - 1][0])) {
            String[] temp = lesson_name[tempo];
            lesson_name[tempo] = lesson_name[tempo - 1];
            lesson_name[tempo - 1] = temp;
            tempo--;
        }
    }
    for (int j = 1; j < lesson_name.length; j++) {

        int tempo = j;
        while (tempo > 0 && Integer.parseInt(lesson_name[tempo][0])==Integer.parseInt(lesson_name[tempo - 1][0]) && Integer.parseInt(lesson_name[tempo][1])>Integer.parseInt(lesson_name[tempo - 1][1])) {
            String[] temp = lesson_name[tempo];
            lesson_name[tempo] = lesson_name[tempo - 1];
            lesson_name[tempo - 1] = temp;
            tempo--;
    }}
  }
  public static Boolean CheckDouble(String Username, String password){
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
        Statement statement=connection.createStatement();
        String SQL;
        SQL="select username from user where username='"+Username+"' and passwordd='"+password+"'" ;    
        ResultSet resultSet=statement.executeQuery(SQL);
        ResultSetMetaData rsmd = resultSet.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        if(!resultSet.next()){ 
          return true;
        }
        else 
          return false;
      }
        catch (Exception e) {
         e.printStackTrace();
    }
    return false;
  }
  public static void SearchUser(String Username,String password){
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
        Statement statement=connection.createStatement();
        String SQL;
        SQL="select first_name,last_name,email,packet,passwordd,username from user where username='"+Username+"' and passwordd='"+password+"'" ;    
        ResultSet resultSet=statement.executeQuery(SQL);
        ResultSetMetaData rsmd = resultSet.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (resultSet.next()) {
          for (int i = 1; i <= columnsNumber; i++) {
            String columnValue = resultSet.getString(i);
            if(i==1) xristis[0]=columnValue;
            if(i==2) xristis[1]=columnValue;
            if(i==3) xristis[2]=columnValue;
            if(i==4) xristis[3]=columnValue;
            if(i==5) xristis[4]=columnValue;
            if(i==6) xristis[5]=columnValue;
            }
        }    
      }
        catch (Exception e) {
         e.printStackTrace();
    }
  }

  public static int CheckProfile(String username) {
    int teacher = 0;
    int student = 0;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root", "Sn1701sn1701!");
      Statement statement = connection.createStatement();
      String SQL;
      SQL = "SELECT username FROM professor where username='" + username + "'";
      ResultSet resultSet = statement.executeQuery(SQL);
      if (resultSet.next())
        teacher = 1;
      else
        teacher = 0;
    } catch (Exception e) {
      e.printStackTrace();
    }
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root", "Sn1701sn1701!");
      Statement statement = connection.createStatement();
      String SQL;
      SQL = "SELECT username FROM student where username='" + username + "'";
      ResultSet resultSet = statement.executeQuery(SQL);
      if (resultSet.next())
        student = 1;
      else
        student = 0;
    } catch (Exception e) {
      e.printStackTrace();
    }
    if (teacher == 0 && student == 0)
      return 0;
    else if (teacher == 0 && student == 1)
      return 1;
    else if (teacher == 1 && student == 0)
      return 2;
    else
      return 3;

  }


}