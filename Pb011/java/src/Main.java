import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {
	public int[][] tab;
	private int calcsize;
    private int max = 0;

    public Main(String file, int n, int calcsize){
    	assert(calcsize > n);
    	try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String ligne;
            String[] line;
            int i = 0;
            this.calcsize = calcsize;
            tab = new int[n][n];
            while ((ligne = br.readLine()) != null) {
                line = ligne.split(" ");
                for(int j = 0; j < line.length; j++) {
                	tab[i][j] = Integer.parseInt(line[j]);
                	System.out.print(tab[i][j]+" ");
                }
                System.out.println();
                i++;
            }
            resolve();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int getMax(){
    	return this.max;
    }
    
    private int diag1Calc(int i, int j) {
    	if(i < 0 || j < 0 || j+calcsize > tab.length || i+calcsize > tab.length) {
    		return 0;
    	}
    	else {
	    	int rep = 1;
	    	for(int k = 0; k < calcsize; k++) {
	    		rep = rep * tab[i+k][j+k];
	    	}
	    	return rep;
    	}
    }
    
    private int diag2Calc(int i, int j) {
    	if(i < 0 || j-calcsize+1 < 0 || j >= tab.length || i+calcsize > tab.length) {
    		return 0;
    	}
    	else {
	    	int rep = 1;
	    	for(int k = 0; k < calcsize; k++) {
	    		rep = rep * tab[i+k][j-k];
	    	}
	    	return rep;
    	}
    }
    
    private int lineCalc(int i, int j) {
    	if(i < 0 || j < 0 || j+calcsize > tab.length || i >= tab.length) {
    		return 0;
    	}
    	else {
	    	int rep = 1;
	    	for(int k = 0; k < calcsize; k++) {
	    		rep = rep * tab[i][j+k];
	    	}
	    	return rep;
    	}
    }
    
    private int columnCalc(int i, int j) {
    	if(i < 0 || j < 0 || j >= tab.length || i+calcsize > tab.length) {
    		return 0;
    	}
    	else {
	    	int rep = 1;
	    	for(int k = 0; k < calcsize; k++) {
	    		rep = rep * tab[i+k][j];
	    	}
	    	return rep;
    	}
    }
    
    private void resolve() {
    	for(int i = 0; i < tab.length; i++){
    		for(int j = 0; j < tab.length; j++) {
    			if(diag1Calc(i,j) > max) {
    				max = diag1Calc(i,j);
    			}
    			if(diag2Calc(i,j) > max) {
    				max = diag2Calc(i,j);
    			}
    			if(lineCalc(i,j) > max) {
    				max = lineCalc(i,j);
    			}
    			if(columnCalc(i,j) > max) {
    				max = columnCalc(i,j);
    			}
    		}
    	}
    }

    public static void main(String[] args){
        Main rep = new Main("../ressource/donnee.txt", 20, 4);
        System.out.println(rep.diag1Calc(6, 8));
        System.out.println(rep.getMax());
    }
}