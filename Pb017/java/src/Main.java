public class Main {
	private static int countLetter(String a) {
		int rep = 0;
		for(int i = 0; i < a.length(); i++) {
			if(97 <= a.codePointAt(i) && a.codePointAt(i) <= 122) {
				rep++;
			}
		}
		return rep;
	}

    public static void main(String[] args){
    	int n = 1000;
    	int rep = 0;
    	for(int i = 1; i <= n; i ++) {
    		rep += countLetter(WritenNumber.toWritenNumber(i));
    	}
    	System.out.println(rep);
    }
}