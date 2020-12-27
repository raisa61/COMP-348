
public aspect aspect_q8 {
	public int Shape.id;
	
	declare parents : Circle implements Shape;
	declare parents : Rectangle implements Shape;
	
	pointcut circle(Circle c): execution(Circle.new(double)) && this(c);
	
	pointcut rectangle(Rectangle r): execution(Rectangle.new(double, double)) && this(r);
	
	public int Shape.getId() {
		return this.id;
	}
	
	before(Circle c): circle(c) {
		c.id = aspect_q7.id;
	}
	
	before(Rectangle r): rectangle(r) {
		r.id = aspect_q7.id;
	}
	
}
