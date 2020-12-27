


public privileged aspect aspect_q7 {

	double radius, width, height;
	public static int id = 1;
	
	declare parents : Circle implements Shape;
	declare parents : Rectangle implements Shape;
	
	double around(Circle c): execution(double Circle.getArea()) && this(c){
		if (c.radius < 0) {
			return 0;
		} else {
			return proceed(c);
		}
	}
	
	double around(Circle c): execution(double Circle.getPerimeter()) && this(c){
		
		if (c.radius < 0) {
			return 0;
		} else {
			return proceed(c);
		}
	}
	
	double around(Rectangle r): execution(double Rectangle.getArea()) && this(r){
		
		if (r.height < 0 || r.width < 0) {
			return 0;
		} else {
			return proceed(r);
		}
	}
	
	double around(Rectangle r): execution(double Rectangle.getPerimeter()) && this(r){
		
		if (r.height < 0 || r.width < 0) {
			return 0;
		} else {
			return proceed(r);
		}
	}
	
	pointcut circle(Circle c): execution(Circle.new(double)) && this(c);
	
	pointcut rectangle(Rectangle r): execution(Rectangle.new(double, double)) && this(r);
	
	after(Circle c): circle(c){
		id++;
	}
	
	after(Rectangle r): rectangle(r){
		
		id++;
	}
}
