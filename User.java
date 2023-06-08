abstract public class User {
    String onoma;
    String epitheto;
    String password;
    int age;
    String kathgoria;
    int arithmosMathimaton;
    boolean profile;
    boolean prof=false;
    public User(String first_name,String last_name,String password,String email,int id,String packet,String user){
        this.onoma=first_name;
        this.epitheto=last_name;
        this.password=password;        
        this.kathgoria=packet;
        this.arithmosMathimaton=1;
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
