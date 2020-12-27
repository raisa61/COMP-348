import java.math.BigDecimal;

public class Employee implements Person {
	String ID;
	String first_name;
	String last_name;
	BigDecimal Salary;
	
	
	/**
	 * @param iD
	 * @param first_name
	 * @param last_name
	 * @param salary
	 */
	public Employee(String iD, String first_name, String last_name, BigDecimal salary) {
		super();
		ID = iD;
		this.first_name = first_name;
		this.last_name = last_name;
		Salary = salary;
	}

	
	public String getID() {
		return ID;
	}
	
	public String getFirstName() {
		return first_name;
	}
	
	public String getLastName() {
		return last_name;
	}
	
	public BigDecimal getSalary() {
		return Salary;
	}

	@Override
	public String toString() {
		return ID+ ","+first_name+ "," +last_name+ ","+ Salary;
	}
	
	public static Person parse(String input_string ) {
		String[] temp = input_string.split(",");
		
//the fields can not be null, the first and last data must be a numeric string, the second and third data can not contain numbers
		try{
			if((temp[0]== "") || (temp[1]=="") || (temp[2]=="") || (temp[3]=="") || 
			  !(temp[0].matches("-?\\d+(\\.\\d+)?")) || !(temp[3].matches("-?\\d+(\\.\\d+)?"))
	        	  || (temp[1].matches(".*\\d.*") || (temp[2].matches(".*\\d.*")))) 
			{
				System.out.println("The input file contains error. The program will stop.");
				System.exit(0);	
			}
		} catch (Exception e) {
			System.out.println("The input file contains error. The program will stop.");
			System.exit(0);
		}
		
		return (Person)new Employee(temp[0], temp[1], temp[2], new BigDecimal(temp[3]));
		
	}
	

}

