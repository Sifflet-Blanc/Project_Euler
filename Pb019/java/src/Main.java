public class Main {
	//hear jan == 0
	private int mouth;
	private int years;
	private int day_of_week;
	
	public Main() {
		this.mouth = 0;
		this.years = 1900;
		this.day_of_week = 0;
	}
	
	public Main(int mouth, int years) {
		this();
		if(years >= 1900 && mouth >= 0 && mouth < 12) {
			while(this.mouth != mouth || this.years != years) {
				forwardNextMouth();
			}
		}
		else {
			throw new DateFormatException();
		}
	}
	
	public int getMouth() {
		return this.mouth;
	}
	
	public int getYears() {
		return this.years;
	}
	
	public int getDayOfWeek() {
		return this.day_of_week;
	}
	
	public void forwardNextMouth() {
		int tmp = 0;
		//special case of feb
		if(mouth == 1) {
			if((years % 100 != 0 && years % 4 == 0) || (years % 100 == 0 && years % 400 == 0)) {
				tmp = 29;
			}
			else {
				tmp = 28;
			}
		}
		else {
			if(mouth == 3 || mouth == 5 || mouth == 8 || mouth == 10) {
				tmp = 30;
			}
			else {
				tmp = 31;
			}
		}
		this.mouth ++;
		if(mouth == 12) {
			this.mouth = 0;
			this.years++;
		}
		this.day_of_week = (this.day_of_week + tmp) % 7;
	}

    public static void main(String[] args){
    	Main rep = new Main(0, 1901);
    	int count = 0;
    	while(rep.getYears() != 2001 || rep.getMouth() != 0) {
    		if(rep.getDayOfWeek() == 5) {
    			count++;
    		}
    		rep.forwardNextMouth();
    	}
        System.out.println(count);
    }
}