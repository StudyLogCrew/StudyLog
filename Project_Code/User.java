public class User {
    String onoma;
    String epitheto;
    String passward;
    int age;
    int ID;
    int kathgoria;
    int arithmosMathimaton;
    int arithmosProtereotitas;
    int aritmosQuiz;
    boolean profProf=false;
    boolean profStud=false;
    public User(RegistrationForm dilosoulaTreloula){
        this.onoma=dilosoulaTreloula.onoma;
        this.epitheto=dilosoulaTreloula.epitheto;
        this.passward=dilosoulaTreloula.passward;
        this.ID=dilosoulaTreloula.ID;
        kathgoria=0;
        arithmosMathimaton=1;
        arithmosProtereotitas=0;
        aritmosQuiz=1;
    }
    public User(){}
    public void setkathgoria(int paketo){
        if(paketo==0){}
        else if(paketo==1){}
        else if(paketo==2){}       // edo prosarmozoume ta paketa
    }
}
