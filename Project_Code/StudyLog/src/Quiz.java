import java.sql.*;
import java.util.*;
public class Quiz {
 static String quiz[] = new String[50];
 static String answer[][] = new String[50][50];  
 static String correct_answer[] = new String[50]; 
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
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
           Statement statement=connection.createStatement();
           String SQL="SELECT question,ans_a,ans_b,ans_c,correct_ans FROM quiz where category= '"+answer_me+"' ORDER BY RAND() LIMIT 10;";
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


    public static void StartQuiz (Student math){ 
     Scanner loool= new Scanner(System.in);
     int sostesApanthseis=0;
     float pososto=0;
     for(int i=0;i<quiz.length;i++){
         System.out.println(quiz[i]);
         System.out.println("You're possible answers are (a)=>"+answer[i][0]+"  (b)=>"+answer[i][1]+"  (c)=>"+answer[i][2]+" (a/b/c)");
         loool.nextLine();
         String apantisi=loool.nextLine();        
         
         if(apantisi.equals(correct_answer[i])){
             sostesApanthseis++;
         }
     }
     pososto = (sostesApanthseis/10)*100;
     if(pososto>=90.0){
         getKey = KeyCreate(math);
         System.out.println("You just got you're key!! CONGRATS :) ");
     }
     else{
          System.out.println("I'm afraid you've failed this time :( ");
         //MyFrame minimaApotyxias = new MyFrame(); //thelei simplirosi
     }
     loool.close();
 }
    
    public static String KeyCreate(Student math){
     String characters = "abcdefghijklmnopqrstuvwxyz";
     StringBuilder sb = new StringBuilder();
     Random random = new Random();
     for (int i=0;i<5;i++) {
         char randomChar = characters.charAt(random.nextInt(characters.length()));
         sb.append(randomChar);
     }
     try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyLog", "root","Sn1701sn1701!");
        Statement statement=connection.createStatement();
        String SQL;
        SQL="INSERT INTO student_keys (st_username, st_key) VALUES ("+math.Username+","+sb.toString()+")";
        statement.executeUpdate(SQL);
          }
        
    catch (Exception e) {
         e.printStackTrace();
     }
     return sb.toString();
     }
}