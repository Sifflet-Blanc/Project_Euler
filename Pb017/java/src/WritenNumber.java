
public class WritenNumber {
	private static String[] unit = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
	private static String[] tens = {"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
	private static String hundred = "hundred";
	private static String[] superiorUnit = {"thousand", "million", "billion", "trillion"};
	
	private static String toWritenNumber(int a, boolean and) {
		String rep = new String();
		if(a == 0){
			return unit[0];
		}
		
		int tmp = a % 100;
		a = a/100;
		if(tmp != 0) {
			if(tmp < 20) {
				rep += unit[tmp];
			}
			else {
				rep += tens[(tmp/10) -2];
				if(tmp % 10 > 0) {
					rep += "-"+unit[tmp % 10];
				}
			}
		}
		
		tmp = a % 10;
		a = a/10;
		String sep = " ";
		if(and) {
			sep = " and ";
		}
		if(tmp != 0) {
			if(rep.equals("")) {
				rep = unit[tmp] + " " + hundred;
			}
			else {
				rep = unit[tmp] + " " + hundred + sep + rep;
			}
		}
		
		tmp = a % 1000;
		a = a/1000;
		int i = 0;
		while(tmp != 0) {
			if(tmp != 0) {
				rep = toWritenNumber(tmp, Boolean.FALSE) + " " + superiorUnit[i] + " " + rep;
			}
			tmp = a % 1000;
			a = a/1000;
			i++;
		}
		
		return rep;
	}
	
	public static String toWritenNumber(int a) {
		return toWritenNumber(a, Boolean.TRUE);
	}
}
