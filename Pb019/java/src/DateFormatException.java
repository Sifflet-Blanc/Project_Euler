
public class DateFormatException extends RuntimeException{
	private static final long serialVersionUID = 1L;

	public DateFormatException() {
		super("This function work for valid date superior to 1 jan 1900");
	}
}
