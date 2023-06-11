public class User {
    String onoma;
    String epitheto;
    String password;
    String email;
    String Username;
    String packet;
    int maxLessons;
    int priority;
    int quiz;
    public User(String first_name,String last_name,String password,String packet,String email,String user){
        this.onoma=first_name;
        this.epitheto=last_name;
        this.password=password;        
        this.packet=packet;
        this.Username=user;
        this.email=email;
        this.PacketXP();
    }
    public void PacketXP(){
        if(this.packet.equals("no_packet")){
         this.maxLessons=1;
         this.priority=0;
         this.quiz=0;
        }
        else if(this.packet.equals("silver")){
         this.maxLessons=3;
         this.priority=1;
         this.quiz=3;   
        }
        else if(this.packet.equals("golden")){
            this.maxLessons=10000;
            this.priority=2;
        }       // edo prosarmozoume ta paketa
    }
}