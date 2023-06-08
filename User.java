abstract public class User {
    String onoma;
    String epitheto;
    String passward;
    int age;
    int ID;
    int kathgoria;
    int arithmosMathimaton;
    boolean profile;
    boolean prof=false;
    public User(RegistrationForm dilosoulaTreloula, boolean apofash){
        this.onoma=dilosoulaTreloula.onoma;
        this.epitheto=dilosoulaTreloula.epitheto;
        this.passward=dilosoulaTreloula.passward;
        this.ID=dilosoulaTreloula.ID;
        this.kathgoria=0;
        this.arithmosMathimaton=1;
        this.profile=false;
        this.prof=apofash;
    }
    public void setkathgoria(int paketo){
        if(paketo==0){
        }
        else if(paketo==1){
            kathgoria=1;
            
        }
        else if(paketo==2){}       // edo prosarmozoume ta paketa
    }
}
