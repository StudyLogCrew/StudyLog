import java.util.Scanner;  // Import the Scanner class

public class PreLoginMenu {
    public static boolean functionable(){    

      int epilogh = 1; // tha exei tin epilogh 1 2 h 3
      //MyFrame ArxikiOthoni = new MyFrame(); //Eisagogi arxikis epiloghs
      boolean termatismos=false;
      Scanner scan = new Scanner(System.in);  // Create a Scanner object
      System.out.println("Enter epilogh: 1=Register 2=Login 0=Termatismos");
      epilogh=scan.nextInt();
      //scan.close();
      System.out.flush(); 
      while(epilogh!=0||!termatismos){
        if(epilogh==1){    //RegisterScreen
          String onoma;
          String epitheto;
          String password;
          String email;
          String Username;
          String paketo;
          Scanner aaa= new Scanner(System.in);
          System.out.println("Dose onoma: ");
          onoma=aaa.nextLine();
          System.out.println("Dose epitheto: ");
          epitheto=aaa.nextLine();
          System.out.println("Dose password: ");
          password=aaa.nextLine();
          System.out.println("Dose email: ");
          email=aaa.nextLine();
          System.out.println("Dose Username: ");
          Username=aaa.nextLine();
          System.out.flush(); 
          //kodikas sygkrisis diplon stoixeion
          if (onoma.isEmpty()||epitheto.isEmpty()||email.isEmpty()||Username.isEmpty()||password.isEmpty()){
            System.out.println("Symplhrose ta stoixeia pou upoliponte --> Epistrofh sthn arxikh");
            return true;
          }
          else if(SearchProffesor.CheckDouble(Username,password)){
            System.out.println("Yparxei idi acount --> Epistrofh sthn arxikh");
            return true;
          }
          else{
            System.out.println("Epelexe paketo: 1)silver 2)holden 3:no_packet ");
            paketo=scan.nextLine();                   //EDO MPOREI NA PREPEI NA GINEI INT
          }

          RegistrationForm dilosoula= new RegistrationForm(onoma, epitheto, password, email, paketo, Username);

          dilosoula.CreateAcc();
        }
        if(epilogh==2){     //LoginScreen
          Scanner pip = new Scanner(System.in);  // Create a Scanner object
          System.out.println("Dose Username: ");
          String name = pip.nextLine();
         // pip.close();
          
          Scanner abc = new Scanner(System.in);  // Create a Scanner object
          System.out.println("Dose kodiko: ");
          String pass = abc.nextLine();
         // abc.close();
         System.out.flush(); 

          SearchProffesor.SearchUser(name, pass);
          User xristis = new User(SearchProffesor.xristis[0],SearchProffesor.xristis[1],SearchProffesor.xristis[2],SearchProffesor.xristis[3],SearchProffesor.xristis[4],SearchProffesor.xristis[5]);
          termatismos=MenuEpilogis.MenuEpilogisUser(xristis);
          return false;    //otan o xristis teleiosei apo to login tote i efarmogi tha termatizei
        }
        if(epilogh==0){
          return false;     //edo theloume na telionei i efarmogi
        }
        else{
          System.out.println("Dosate lathos eisodo! \n \n");
        }
      }
      scan.close();
      return true;
    }
}
