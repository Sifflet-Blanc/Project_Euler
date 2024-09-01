public class Main {
    public static void main(String[] args){
        int rep = 1;
        int interval = 2;
        int k = 1;
        /*<= n, n représente la taille du cote de la spirale (donc forcement impaire*/
        while(interval+1 <= 1001){
            for(int i = 0; i < 4; i++){
                k += interval;
                rep += k;
            }
            interval += 2;
        }
        System.out.println(rep);
    }
}