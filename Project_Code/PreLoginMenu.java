public class PreLoginMenu {
    public static boolean functionable(){     

      int epilogh = 1; // tha exei tin epilogh 1 2 h 3
      if(epilogh==1){    //RegisterScreen
        RegistrationForm dilosi = new RegistrationForm();
        MyFrame RegisterScreen = new MyFrame(); // Edo upothetoume eisagontai ta stoixeia kai tha eisagontai sto registration form
        //kodikas sygkrisis diplon stoixeion
        if (dilosi.ID==0||dilosi.age==0||dilosi.epitheto==null||dilosi.onoma==null||dilosi.passward==null){
          MyFrame minimaLathous = new MyFrame(); // ta frames tha ta prosarmosoume pio meta me ta katallila orismata
          return true;
        }
        else{
          User xristis = new User(dilosi) //tha pasaroume ston constructor tou user to registration form
          //synexizoume me tin ekxorisi tou user stin db
          int packkage;
          MyFrame paketa = new MyFrame(); //eisagogi apo ton xrhsth gia paketo
          xristis.setkathgoria(packkage);
        }
      }
      if(epilogh==2){     //LoginScreen
          return true;
      }
      if(epilogh==3){
        return false;
      }
    }
}
