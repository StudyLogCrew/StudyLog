
public class Teacher extends User{
String address;
int votes;
int age;
    public Teacher(String first_name,String last_name,String password,String email,String packet,String user,String address,int votes,int age){
      super(first_name,last_name,password,email,packet,user);  
      this.age=age;
      this.address=address;
      this.votes=votes;
    }

}
