


public privileged aspect aspect_q6 {
	
	double radius;

	declare parents : Circle implements Shape;
	
	double around(Circle c): execution(double Circle.getArea()) && this(c){
		
		return Math.PI * c.radius * c.radius;
	}
}
