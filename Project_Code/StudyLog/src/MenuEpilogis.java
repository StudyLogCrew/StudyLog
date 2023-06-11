import java.util.Scanner;

public class MenuEpilogis {
    public static Boolean MenuEpilogisUser(User xristis){
        int apofash=0;
        while(apofash!=3){
            System.out.println("Tha itheles na dimiourgiseis kainourgio profile?: 1=YES\n 2=NO (Synexeia Sto programma)\n 3=Exodos \n");
            Scanner scan = new Scanner(System.in);
            apofash=Integer.valueOf(scan.nextInt());
            if(apofash==1){
                apofash=0;
                CreateProfile.createProfill(xristis);
            }
            else if(apofash==2){
                System.out.println("thes na synexiseis san kathigitis i san mathitis?: 1=kathigitis 2=mathitis \n");
                apofash=scan.nextInt();
                if(apofash==1){
                    MenuEpilogisTeacher(xristis);
                }
                else if(apofash==2){
                    MenuEpilogissStudent(xristis);
                }
                else{
                    System.out.println("Lanthasmenh eisodos!");
                }
            }
            else{
                System.out.println("Lanthasmenh eisodos!");
            }
            scan.close();
        }
        return false;
    }
    public static Boolean MenuEpilogisTeacher(User xristis){
        Teacher.Teacherretrieve(xristis.epitheto,xristis.onoma);
        Teacher kath = new Teacher(xristis.onoma,xristis.epitheto,xristis.password,xristis.email,xristis.packet,xristis.Username,Teacher.kathigiti[5],Integer.valueOf(Teacher.kathigiti[7]),Integer.valueOf(Teacher.kathigiti[4]));
        int apofash=0;
        System.out.println("Epelexe: 1)Xanadimiourgise Profile 2)Vlepo MyStudents ");
        int epilogh=0;
        while(epilogh!=0){
            if(epilogh==1){     //create profile
                CreateProfile.createProfill(xristis);
            }
            if(epilogh==2){     //vlepei Mystudents
                
            }   
        }
        return false;
    }
    public static void MenuEpilogissStudent(User xristis){
       // MyFrame syndedemenos = new  MyFrame(); //eite pernoume stoixeia apo db,
        Student.Studentretrieve(xristis.epitheto,xristis.onoma);

        int age=Integer.parseInt(Student.mathitiss[4]);
        Student math = new Student(xristis.onoma,xristis.epitheto,xristis.password,xristis.email,xristis.packet,xristis.Username,age);                      //genika afto einai ena thema, pos tha ginetai pass apo synarthsh se synarthsh o xristis? tha dimiourgoume kathe fora kainourgio object xrisits?
        int epilogh=0;
        System.out.println("1): Anazhthsh kathigiti\n 2)Epilogh random quiz");
        Scanner diavase = new Scanner(System.in);
        epilogh=diavase.nextInt();
        diavase.nextLine();
        
        while(epilogh!=4){
            if(epilogh==1){    //anazhthsh kathigiti
                SearchProffesor.SearchLesson();
            }
            else if(epilogh==2){    //random quiz
                Quiz.getQuiz();
                Quiz.StartQuiz(math);
            }
            else if(epilogh==3){ // add friend
            
            }
            else if(epilogh==4){ //friends interaction

            }   
        }
    }
}
