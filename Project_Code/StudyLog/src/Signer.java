import java.util.Arrays;

import java.sql.*;
import java.util.*;
public class Signer {

           //an tha dhmeiourgeitai antikeimeno sto menu tha tis fygoume apo stati
/*  public static void sign(Student math, Teacher kath ){ 
        kath.vatrhmologia; //set visible telos panton
    }*/
    public static boolean checkRest (Student math){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
            Statement statement=connection.createStatement();
            String SQL;
            SQL="SELECT COUNT(username) from student_group where username="+math.Username+"";
            ResultSet resultSet=statement.executeQuery(SQL);
            math.registered_lessons=resultSet.getInt(1);            
        }
            
        catch (Exception e) {
             e.printStackTrace();
         }
        if(math.maxLessons == math.registered_lessons)
            return false;
        else{
            return true;
        }
    }
    public static Boolean[][] CheckTT(Student math,Teacher kath,int x,int y,boolean atomiko){
        int[] Counter = new int[kath.maxLessons];
        for(int i=0;i<kath.TimeTable.length;i++){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
            Statement statement=connection.createStatement();
            String SQL;
            SQL="Select COUNT(st_username) from student_timetable where pr_username="+kath.Username+" AND day="+kath.TimeTable[i][0]+" AND hour="+kath.TimeTable[i][1]+"";
            ResultSet resultSet=statement.executeQuery(SQL);
            Counter[i] = resultSet.getInt(1);
              }
            
        catch (Exception e) {
             e.printStackTrace();
         }}
        Boolean[][] diathesima= new Boolean[x][y];
        for(int i=0;i<x;i++){
            for(int j=0;j<y;j++){
                if(Integer.parseInt(kath.TimeTable[i][4])>Counter[i]){
                    diathesima[i][j]=true;   //adeia thesi
                }
                // else if((kath.programma.diathesimo[x][y]!=0) && (!atomiko)){ //edo prepei na prosthesoume diathesimes ores se kathe mathima
                //     diathesima[i][j]=true;   //den einai atomiko
                // }
                else{
                    diathesima[i][j]=false;;   //tmima katelimeno kai mi atomiko
                }
            }
        }
        return diathesima;
    }
/*public static boolean Checksubject(Teacher kath, String Math){
        for(int i=0;i<kath.mathimata.lenth;i++)         //elegxos na doume an yparxei mathima
        kath.mathimata
    }*/
 public static float calculateCost(Student math,Teacher kath,String x,String y){
        float kostos=0;
        int check=0;
        for(int i=0;i<kath.TimeTable.length;i++)
        {
            if(kath.TimeTable[i][0].equals(x) && kath.TimeTable[i][1].equals(y))
            {
                kostos=Integer.parseInt(kath.TimeTable[i][3]);
            }
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
            Statement statement=connection.createStatement();
            String SQL;
            SQL="Select COUNT(st_key) from student_keys where st_username="+math.Username+"";
            ResultSet resultSet=statement.executeQuery(SQL);
            check = resultSet.getInt(1);
              }
            
        catch (Exception e) {
             e.printStackTrace();
         }
        if(check>=1){
            kostos = kostos/2;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
                Statement statement=connection.createStatement();
                String SQL;
                SQL="DELETE FROM student_keys WHERE st_username = "+math.Username+" LIMIT 1";
                statement.executeUpdate(SQL);
                  }
                
            catch (Exception e) {
                 e.printStackTrace();
             }
        }
        return kostos;
    }

    public static void hourLock (Teacher kath,String x,String y){
        for(int i=0;i<kath.TimeTable.length;i++)
        {
            if(kath.TimeTable[i][0].equals(x) && kath.TimeTable[i][1].equals(y))
            {
                kath.TimeTable[i][5]="1 slot LOCKED";
            }
        }
    }
}
