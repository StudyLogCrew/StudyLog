public class Teacher {
    String onoma;
    String epitheto;
    String passward;
    int age;
    int ID;
    int kathgoria;
    int arithmosMathimaton;
    int arithmosProtereotitas;
    public Teacher(User xristis){
        this.onoma=xristis.onoma;
        this.epitheto=xristis.epitheto;
        this.passward=xristis.passward;
        this.ID=xristis.ID;
        this.kathgoria=xristis.kathgoria;
        this.arithmosMathimaton=xristis.arithmosMathimaton;
        this.arithmosProtereotitas=xristis.arithmosProtereotitas;
    }    
}
