import java.util.Arrays;

public class Signer {       //an tha dhmeiourgeitai antikeimeno sto menu tha tis fygoume apo stati
/*     public static void sign(Student math, Teacher kath ){ 
        kath.vatrhmologia; //set visible telos panton
    }*/
    public static boolean checkRest (Student math){
        if(math.arithmosMathimaton==0)
            return false;
        else{
            math.arithmosMathimaton--;
            return true;
        }
    }
    public static Boolean[][] CheckTT(Student math,Teacher kath,int x,int y,boolean atomiko){
        Boolean[][] diathesima= new Boolean[x][y];
        for(int i=0;i<x;i++){
            for(int j=0;j<y;j++){
                if(kath.programma.elefthereia[x][y]!=false){
                    diathesima[i][j]=true;   //adeia thesi
                }
                else if((kath.programma.diathesimo[x][y]!=0) && (!atomiko)){ //edo prepei na prosthesoume diathesimes ores se kathe mathima
                    diathesima[i][j]=true;   //den einai atomiko
                }
                else{
                    diathesima[i][j]=false;;   //tmima katelimeno kai mi atomiko
                }
            }
        }
        return diathesima;
    }
/*public static boolean Checksubject(Teacher kath, String Math){
        for(int i=0;i<kath.mathimata.lenth;i++)         //elegxos na doume an yparxei mathima
        kath.mathimata
    }*/
    public static float calculateCost(Student math,Teacher kath,int x, int y){
        float kostos=0;
        kostos= kath.programma.kostos[x][y];
        if(math.MyKeys.size()!=0){
            kostos = kostos/2;
            math.MyKeys.remove(math.MyKeys.size()-1);
        }
        return kostos;
    }
    public static void hourLock (Teacher kath,int x,int y,String mathima){
        kath.programma.mathimat[x][y] = mathima;
        kath.programma.diathesimo[x][y]--;
    }
}