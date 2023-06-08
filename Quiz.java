import java.util.ArrayList;
import java.util.Random;

public class Quiz {
    public static void mennu (){            //prepei na ginei fortoma apo ssql
        ArrayList<String> erotiseis = new <String>;
        ArrayList<Integer> apanthseis = new <String>;
        int sostesApanthseis=0;
        float pososto=0;
        for(int i=0;i<10;i++){
            System.out.println(erotiseis.get(i));
            //input tha ginei me frame
            Integer apanthsh=0;
            if(apanthseis.get(i)==apanthsh){
                sostesApanthseis++;
            }
        }
        pososto = sostesApanthseis/10;
        if(pososto>=90.0){
            String myKey = KeyCreate();
        }
        else{
            MyFrame minimaApotyxias = new MyFrame(); //thelei simplirosi
        }
    }
    public static String KeyCreate(){
        String characters = "abcdefghijklmnopqrstuvwxyz";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i=0;i<5;i++) {
            char randomChar = characters.charAt(random.nextInt(characters.length()));
            sb.append(randomChar);
        }
        return sb.toString();
    }
}
