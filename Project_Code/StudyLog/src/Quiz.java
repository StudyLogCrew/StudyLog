import java.util.Random;
import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
public class Quiz {
 static String quiz[];
 static String answer[][];  
 static String correct_answer[]; 
 static String getKey;
    static public void getQuiz()
    {
       int j=0;
       Scanner scan= new Scanner(System.in);
       System.out.println("Choose you're quiz subject (History/Science/General): ");
       String answer_me=scan.nextLine();
       scan.close();
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "lefteris","123");
           Statement statement=connection.createStatement();
           String SQL="SELECT question,ans_a,ans_b,ans_c,correct_ans FROM quiz where categorey= "+answer_me+" ORDER BY RAND() LIMIT 10;";
           ResultSet resultSet=statement.executeQuery(SQL);
           ResultSetMetaData rsmd = resultSet.getMetaData();
           int columnsNumber = rsmd.getColumnCount();
           while (resultSet.next()) {
             for (int i = 1; i <= columnsNumber; i++) {
              // if (i > 1) System.out.print(",  ");
                 String columnValue = resultSet.getString(i);
               //  System.out.print(columnValue);
               if(i==1) quiz[j]=columnValue;
               if(i==2 || i==3 || i==4) answer[j][i-1]=columnValue;
               if(i==5) correct_answer[j]=columnValue;
               }
       j++;
   }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void StartQuiz (){ 
     Scanner scan= new Scanner(System.in);
     int sostesApanthseis=0;
     float pososto=0;
     String apantisi;
     for(int i=0;i<quiz.length;i++){
         System.out.println(quiz[i]);
         System.out.println("You're possible answers are (a)=>"+answer[i][0]+"  (b)=>"+answer[i][1]+"  (c)=>"+answer[i][2]+" (a/b/c)");
         apantisi=scan.nextLine();        
         
         if(apantisi.equals(correct_answer[i])){
             sostesApanthseis++;
         }
     }
     pososto = (sostesApanthseis/10)*100;
     if(pososto>=90.0){
         getKey = KeyCreate();
         System.out.println("You just got you're key!! CONGRATS :) ");
     }
     else{
          System.out.println("I'm afraid you've failed this time :( ");
         //MyFrame minimaApotyxias = new MyFrame(); //thelei simplirosi
     }
     scan.close();
 }
    
    public static String KeyCreate(){
     String characters = "abcdefghijklmnopqrstuvwxyz";
     StringBuilder sb = new StringBuilder();
     Random random = new Random();
     for (int i=0;i<5;i++) {
         char randomChar = characters.charAt(random.nextInt(characters.length()));
         sb.append(randomChar);
     }
     return sb.toString();
     }
}
