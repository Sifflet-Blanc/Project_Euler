import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

public class Main {
	private List<List<Integer>> tab;
	private List<Integer> sum;
	private int significantDigit;

    public Main(String file, int significantDigit){
    	try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String ligne;
            this.tab = new ArrayList<>();
            this.sum = new ArrayList<>();
            this.significantDigit = significantDigit;
            while((ligne = br.readLine()) != null) {
            	List<Integer> tabi = new ArrayList<>();
                for(int j = ligne.length()-1; j >=0 ; j--) {
                	tabi.add(Integer.parseInt(String.valueOf(ligne.charAt(j))));
                }
                tab.add(tabi);
            }
            resolve();
        }
    	catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getFirstSignificantDigitOfSum(){
    	String rep = "";
    	int i = 0;
    	while(i < sum.size() && i < significantDigit) {
    		rep = rep + sum.get(sum.size() - i - 1);
    		i++;
    	}
    	return rep;
    }
    
    private void resolve() {
    	for(int i = 0; i < tab.size(); i++){
    		addBToA(this.sum, tab.get(i));
    	}
    }
    
    //met le resultat de la somme dans la Liste a
    public static void addBToA(List<Integer> a, List<Integer> b){
    	int retenue = 0;
    	int i = 0;
    	while(i < Integer.min(a.size(), b.size())){
    		int tmp = a.get(i) + b.get(i) + retenue;
    		a.set(i, tmp % 10);
    		retenue = tmp/10;
    		i++;
    	}
    	while(i < a.size()) {
    		int tmp = a.get(i) + retenue;
    		a.set(i, tmp % 10);
    		retenue = tmp/10;
    		i++;
    	}
    	while(i < b.size()) {
    		int tmp = b.get(i) + retenue;
    		a.add(tmp % 10);
    		retenue = tmp/10;
    		i++;
    	}
    	while(retenue != 0) {
    		a.add(retenue % 10);
    		retenue = retenue/10;
    		i++;
    	}
    }

    public static void main(String[] args){
        Main rep = new Main("../ressource/donnee.txt", 10);
        System.out.println(rep.getFirstSignificantDigitOfSum());
    }
}