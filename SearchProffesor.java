public class SearchProffesor {
    public static void menuu(int id){
        MyFrame Searchbar = new MyFrame();
        Teacher kath = new Teacher(); //edo vazoume anazhthsh sql
        //kath= sql klp klp
        if(kath==null){
            System.out.println("Den vrethike epithimito apotelesma");
            System.out.println("orismena suggestions: ");//tha ginei me my frame
        }
        else{
            Signer.sign(id) //+ san parametro tha mpei eite kathigitis, eite to id tou kathigiti. na doume kai ti ginetai me ta frames (proteino load sto telos)
        }
    }
    public static void suggestions(){

    }
}
