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
    public User(RegistrationForm dilosi){
        this.onoma=dilosi.onoma;
        this.epitheto=dilosi.epitheto;
        this.passward=dilosi.passward;
        this.ID=dilosi.ID;
        kathgoria=0;
        arithmosMathimaton=1;
        arithmosProtereotitas=0;
        aritmosQuiz=1;
    }
    public void setkathgoria(int paketo){
        if(paketo==0){}
        else if(paketo==1){}
        else if(paketo==2){}       // edo prosarmozoume ta paketa
    }
}
