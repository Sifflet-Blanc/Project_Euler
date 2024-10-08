import java.util.HashSet;

public class Main {
	public static boolean is_1_through_9_pandigital(int a, int b) {
		int c = a*b;
		HashSet<Integer> tab = new HashSet<>();
		while(a > 0) {
			int tmp = a % 10;
			if(tab.contains(tmp) || tmp == 0) {
				return false;
			}
			tab.add(tmp);
			a = a/10;
		}
		while(b > 0) {
			int tmp = b % 10;
			if(tab.contains(tmp) || tmp == 0) {
				return false;
			}
			tab.add(tmp);
			b = b/10;
		}
		while(c > 0) {
			int tmp = c % 10;
			if(tab.contains(tmp) || tmp == 0) {
				return false;
			}
			tab.add(tmp);
			c = c/10;
		}
		return (tab.size() == 9);
	}
	
    public static void main(String[] args){
		HashSet<Integer> seen = new HashSet<>();
    	int rep = 0;
    	for(int a = 1; a < 9999; a++) {
    		String alen = ""+a;
    		int l = (9-alen.length())/2;
    		int m = (int) Math.pow(10, l-1);
    		int n = ((int) Math.pow(10, l))-1;
    		for(int b = Math.max(m, a); b < n; b++) {
    			if(!seen.contains(a*b) && is_1_through_9_pandigital(a, b)) {
        	    	seen.add(a*b);
    	            rep = rep + a*b;
    	        }
    		}
    	}
    	System.out.println(rep);
    }
}