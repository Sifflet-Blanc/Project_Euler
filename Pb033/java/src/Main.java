import java.util.Hashtable;
import java.util.Objects;

public class Main {
	private static double EPSILON = 0.000001;
	
	/**
	 * 
//	 * @param a int 0 <= a represent numerator
	 * @param b int 0 < b represent denominator
	 * @return true if the fraction can be incorrectly simplify
	 */
	private static int[] incorrectly_simplifiable(int a, int b) {
		int[] rep = null;
		int variant = a;
		int acc = 0;
		int tenPow = 1;
		Hashtable<Integer, Integer> decompA = new Hashtable<>(2);
		while(variant > 0) {
			int  tmp = variant % 10;
			variant = variant/10;
			if(!decompA.contains(tmp)) {
				decompA.put(tmp, variant*tenPow+acc);
			}
			acc = acc + tmp*tenPow;
			tenPow = tenPow*10;
		}
		variant = b;
		acc = 0;
		tenPow = 1;
		while(rep == null && variant > 0) {
			int  tmp = variant % 10;
			variant = variant/10;
			if(decompA.containsKey(tmp)) {
				rep = new int[2];
				rep[0] = decompA.get(tmp);
				rep[1] = variant*tenPow+acc;
			}
			acc = acc + tmp*tenPow;
			tenPow = tenPow*10;
		}
		return rep;
	}
	
	private static boolean equalFraction(int a1, int b1, int a2, int b2) {
		return Math.abs(((double) a1 / (double) b1) - ((double) a2 / (double) b2)) < EPSILON;
	}
	
    public static void main(String[] args){
    	int[] rep = new int[2];
    	rep[0] = 1;
    	rep[1] = 1;
    	for(int a = 99; a >= 10; a--) {
    		for(int b = a+1; b <= 99; b++) {
    			int[] tmp = incorrectly_simplifiable(a, b);
    			if(!Objects.isNull(tmp) && equalFraction(a, b, tmp[0], tmp[1]) && a % 10 != 0 && b % 10 != 0) {
    				if((rep[1]*tmp[1]) % tmp[0] == 0) {
    					rep[1] = (rep[1]*tmp[1])/tmp[0];
    				}
    				else {
    					rep[0] = rep[0]*tmp[0];
    					rep[1] = rep[1]*tmp[1];
    				}
    				System.out.println(a+"/"+b);
    			}
    		}
    	}
    	System.out.println(rep[1]);
    }
}