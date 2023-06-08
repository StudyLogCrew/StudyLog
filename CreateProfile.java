public class CreateProfile {
    public static void createProfill(int id, int apofash){
        if(apofash==0){
            System.out.println("Den exeis dimiourgisei profile gia kathigiti i mathiti, epelexe poio apo ta 2");  //tha to kanoume me frame
            int epilogh=0;
            User xristis = new User();
            if(epilogh==0){
                //edo tha eisagontai ta dedomena gia create profile kathigiti
                xristis.profProf=true;
                Teacher prof = new Teacher(xristis);
                //eisagogi teacher sto db
            }  
            if(epilogh==1){
                //edo tha eisagontai ta dedomena gia create student prfile
                xristis.profProf=true;
                Student mathitis= new Student(xristis);
                //eisagogi student sto db
            }
        }
        else if(apofash==1){
            //edo tha eisagontai ta dedomena gia create profile kathigiti
            xristis.profProf=true;
            Teacher prof = new Teacher(xristis);
            //eisagogi teacher sto db
        }
        else if(apofash==2){
            //edo tha eisagontai ta dedomena gia create student prfile
            xristis.profProf=true;
            Student mathitis= new Student(xristis);
            //eisagogi student sto db
        } 
    }
}
