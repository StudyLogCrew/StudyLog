public class PreLoginMenu {
    public static boolean functionable(){    

      int epilogh = 1; // tha exei tin epilogh 1 2 h 3
      MyFrame ArxikiOthoni = new MyFrame(); //Eisagogi arxikis epiloghs
      if(epilogh==1){    //RegisterScreen
        RegistrationForm dilosoula = new RegistrationForm();
        MyFrame RegisterScreen = new MyFrame(); // Edo ypothetoume eisagontai ta stoixeia kai tha eisagontai sto registration form
        //kodikas sygkrisis diplon stoixeion
        if (dilosoula.ID==0||dilosoula.age==0||dilosoula.epitheto==null||dilosoula.onoma==null||dilosoula.passward==null){
          MyFrame minimaLathous = new MyFrame(); // ta frames tha ta prosarmosoume pio meta me ta katallila orismata
          return true;
        }
        else{
          boolean kathigitis=false;
          int packkage=0;
          MyFrame paketa = new MyFrame(); //eisagogi apo ton xrhsth gia paketo
          if(kathigitis){
            Teacher kath = new Teacher(dilosoula); //tha pasaroume ston constructor tou user to registration form
            Teacher.setkathgoria(packkage);
          }
          else{
            Student math = new Student(dilosoula);
            Student.setkathgoria(packkage);
          }
            //synexizoume me tin ekxorisi tou user stin db
          //40 edo prepei na eisagoume ton xristouli stin sql
        }
      }
      if(epilogh==2){     //LoginScreen
        MyFrame LoginScreen = new MyFrame(); // Edo ypothetoume eisagontai ta stoixeia gia to login
        String pass;
        String name;
        //40 edo tha ginei to search me ti vash kai theloume na epistrafei to  "teacher" i "student" kai id, an den ginetai prostheto ena bool sto user 
        int id=0;
        MenuEpilogis.MenuEpilogissStudent(id); //mporoume na valoume parametro user, peite gnomh
        MenuEpilogis.MenuEpilogisTeacher(id);
        return false;    //otan o xristis teleiosei apo to login tote i efarmogi tha termatizei
      }
      if(epilogh==3){
        return false;     //edo theloume na telionei i efarmogi
      }
      return false;
    }
}