public class Student extends User{  
    int age;       
    public Student(String first_name,String last_name,String password,String email,String packet,String user,int age){
        super(first_name,last_name,password,email,packet,user);
        this.age=age;   }
}
