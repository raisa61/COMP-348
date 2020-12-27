import java.io.*;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.Collections;
import java.util.DoubleSummaryStatistics;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;


public class driver {

	public static void main(String[] args) {
		
//creating arraylist to store different employees from the text file
		
		ArrayList <Person> employee_list = new ArrayList <>();

//taking input for the file name
		System.out.println("Please enter the name of the file (with the extension) that you want to process: ");
		Scanner sc= new Scanner(System.in);
		String file_name=sc.nextLine();
		
//opening and reading the file
		
		try {
            List<String> empl_Lines = Files.readAllLines(java.nio.file.Paths.get(file_name), StandardCharsets.UTF_8);
            for (String line: empl_Lines)  {
            	 String[] tokens = line.split(",");
            	employee_list.add((Person)Employee.parse(line));
            }
            }
		catch (IOException e) {
                e.printStackTrace();
            }
		
        System.out.println("Showing the data in the unsorted format");
        System.out.println();
        for(Person emp: employee_list) {
        	System.out.println(emp);
        }
        System.out.println();

//sorting the employee list based on their IDs in ascending order
        
        Object[] person_array =  employee_list.toArray();
        Arrays.sort(person_array, (a,b) -> (""+((Person) a).getID()).compareTo(((Person) b).getID()));
        System.out.println("Sorting the array by the people's ID:");
        System.out.println();
        Stream<Object> stream1 = Arrays.stream(person_array);
        stream1.forEach(System.out::println);
        System.out.println();
        
		
//sorting the employee list alphabetically based on their first name
        System.out.println("Sorting based on First names: ");
        System.out.println();
        Arrays.sort(person_array, (a,b) -> (""+((Person) a).getFirstName()).compareTo(""+((Person) b).getFirstName())); 
        Stream<Object> stream2 = Arrays.stream(person_array);
        stream2.forEach(System.out::println);
        System.out.println();
        
//sorting the employee list alphabetically based on their last name, if same last name, then sorting based on first name
        System.out.println("Sorting based on Last names: ");
        System.out.println();
        Arrays.sort(person_array, (a,b) -> (""+((Person) a).getLastName()).compareTo(""+((Person) b).getLastName())); 
        Arrays.sort(person_array, (a, b) -> {
        	int ck = ("" + ((Person) a).getLastName()).compareTo("" + ((Person) b).getLastName()); // lastName
        	return ck != 0? ck:
        	("" + ((Person) a).getFirstName()).compareTo("" + ((Person) b).getFirstName()); // then firstFame
        	});

        Stream<Object> stream3 = Arrays.stream(person_array);
        stream3.forEach(System.out::println);
        System.out.println();   
		
//showing the total average and the number of the total employees using a stream
				Object[] empl_array=  employee_list.toArray();
				Stream<Object> stream = Arrays.stream(empl_array);
				double avg= stream.mapToDouble(e->((Employee) e).getSalary().doubleValue()).average().getAsDouble();
				BigDecimal avg_sal= new BigDecimal(avg);
				System.out.print("The average salary is: ");
				System.out.printf("%.2f", avg_sal);
				System.out.println();
				System.out.println("The total number of employees is: "+ empl_array.length);
				System.out.println();
                		          
//grouping the employees based on their salary range
								 
				Map<Object, DoubleSummaryStatistics> result = employee_list.stream()
							.collect(Collectors.groupingBy(emp -> 
									 ((Employee) emp).getSalary().doubleValue() < 25000 ? "<25000" :
								     ((Employee) emp).getSalary().doubleValue() < 40000 ? "25000-40000" :
								     ((Employee) emp).getSalary().doubleValue() < 70000 ? "40000-70000" :
									 ((Employee) emp).getSalary().doubleValue() > 70000 ? ">70000" : ">70000",
								     Collectors.summarizingDouble(emp -> ((Employee) emp).getSalary().doubleValue())));
								 
				DoubleSummaryStatistics sal_25 = result.get("<25000");
				double avg_25 = sal_25 == null ? 0.0 : sal_25.getAverage();
				System.out.println("<25000 --> employee count: " + sal_25.getCount() + " --> avg salary: " + String.format("%.2f",avg_25));
								 
								 
				DoubleSummaryStatistics sal_25_40 = result.get("25000-40000");
				double avg_25_40 = sal_25_40 == null ? 0.0 : sal_25_40.getAverage();
				System.out.println("25000-40000 --> employee count: " + sal_25_40.getCount() + " --> avg salary: " + String.format("%.2f",avg_25_40));
								 
				DoubleSummaryStatistics sal_40_70 = result.get("40000-70000");
				double avg_40_70 = sal_40_70 == null ? 0.0 : sal_40_70.getAverage();
				System.out.println("40000-70000 --> employee count: " + sal_40_70.getCount() + " --> avg salary: " + String.format("%.2f",avg_40_70));
								 
								 
				DoubleSummaryStatistics sal_70 = result.get(">70000");
				double avg_70 = sal_70 == null ? 0.0 : sal_70.getAverage();
				System.out.println(">70000 --> employee count: " + sal_70.getCount() + " --> avg salary: " + String.format("%.2f",avg_70));
								 
								 
								 
	}

}
