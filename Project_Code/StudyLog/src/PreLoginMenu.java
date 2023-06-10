import java.util.Scanner;  // Import the Scanner class

public class PreLoginMenu {
    public static boolean functionable(){    

      int epilogh = 1; // tha exei tin epilogh 1 2 h 3
      //MyFrame ArxikiOthoni = new MyFrame(); //Eisagogi arxikis epiloghs
      Scanner scan = new Scanner(System.in);  // Create a Scanner object
      System.out.println("Enter epilogh: 1=Register 2=Login 3=Termatismos");
      if(epilogh==1){    //RegisterScreen
        String onoma;
        String epitheto;
        String password;
        String email;
        String Username;
        String paketo;
        System.out.println("Dose onoma: ");
        onoma=scan.nextLine();
        System.out.println("Dose epitheto: ");
        epitheto=scan.nextLine();
        System.out.println("Dose password: ");
        password=scan.nextLine();
        System.out.println("Dose email: ");
        email=scan.nextLine();
        System.out.println("Dose Username: ");
        Username=scan.nextLine();

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
        MenuEpilogis.MenuEpilogisUser(epilogh);
      }
      if(epilogh==2){     //LoginScreen
        System.out.println("Dose kodiko: ");
        String pass = scan.nextLine();
        System.out.println("Dose Username: ");
        String name = scan.nextLine();
        SearchProffesor.SearchUser(name, pass);
        User xristis = new User(SearchProffesor.xristis[1],SearchProffesor.xristis[3],SearchProffesor.xristis[5],SearchProffesor.xristis[2],SearchProffesor.xristis[4],SearchProffesor.xristis[0]);
        return false;    //otan o xristis teleiosei apo to login tote i efarmogi tha termatizei
      }
      if(epilogh==3){
        return false;     //edo theloume na telionei i efarmogi
      }
      return false;
    }
}
