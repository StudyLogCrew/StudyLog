public class MenuEpilogis {
    public static void MenuEpilogiss(int id){
        MyFrame syndedemenos = new  MyFrame();
        User xristis = new User();                      //genika afto einai ena thema, pos tha ginetai pass apo synarthsh se synarthsh o xristis? tha dimiourgoume kathe fora kainourgio object xrisits?
        if(!xristis.profStud||!xristis.profProf){       //skeftika na einai ypoxreotiko na kaneis create profile prin synexiseis
            CreateProfile.createProfill(id, 0);
        }
        int epilogh=0;
        if(epilogh==0){     //create profile
            System.out.println("epelexe an thes kathigiti i xristi");
            int apofash;
            CreateProfile.createProfill(id, apofash);
        }
        else if(epilogh==1){    //anazhthsh kathigiti

        }
        else if(epilogh==2){    //random quiz

        }
        else if(epilogh==3){
            
        }
    }
}
