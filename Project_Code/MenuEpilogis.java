public class MenuEpilogis {
    public static void MenuEpilogisTeacher(int id){

    }
    public static void MenuEpilogissStudent(int id){
        MyFrame syndedemenos = new  MyFrame(); //eite pernoume stoixeia apo db,
        Student math = new Student();                      //genika afto einai ena thema, pos tha ginetai pass apo synarthsh se synarthsh o xristis? tha dimiourgoume kathe fora kainourgio object xrisits?
        if(!math.prof){       //skeftika na einai ypoxreotiko na kaneis create profile prin synexiseis
            CreateProfile.createProfill(id, 0);
        }
        int epilogh=0;
        if(epilogh==0){     //create profile
            CreateProfile.createProfill(id, 0);
        }
        else if(epilogh==1){    //anazhthsh kathigiti
            SearchProffesor.menuu(id);
        }
        else if(epilogh==2){    //random quiz

        }
        else if(epilogh==3){
            
        }
    }
}
