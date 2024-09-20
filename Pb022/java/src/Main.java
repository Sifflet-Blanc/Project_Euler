import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

public class Main {
	private List<String> names;
	private int sum;

    public Main(String file){
    	try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String ligne;
            String tmp = "";
            this.names = new ArrayList<>();
            this.sum = 0;
            while((ligne = br.readLine()) != null) {
                for(int i = 0; i < ligne.length(); i++) {
                	while(i < ligne.length() && (tmp == "" || (65 <= ligne.codePointAt(i) && ligne.codePointAt(i) <= 90))) {
                		if(65 <= ligne.codePointAt(i) && ligne.codePointAt(i) <= 90) {
                			tmp += ligne.charAt(i);
                		}
            			i++;
                	}
                	this.names.add(tmp);
                	tmp = "";
                }
            }
            resolve();
        }
    	catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int getSum(){
    	return this.sum;
    }
    
    private void resolve() {
    	names.sort(null);
    	int i = 1;
    	for(String a : names) {
    		sum += worthOfNames(a)*i;
    		i++;
    	}
    }
    
    public static int worthOfNames(String a) {
    	int rep = 0;
    	for(int i = 0; i < a.length(); i++) {
    		rep += a.codePointAt(i) -64;
    	}
    	return rep;
    }

    public static void main(String[] args){
        Main rep = new Main("../ressource/names.txt");
        System.out.println(rep.getSum());
    }
}