

public privileged aspect aspect_q5 {
	double radius;
	double width;
	double height;
	/**
	 * declaring the shape interface as the parent of the Circle and the Rectangle class
	 */
	declare parents : Circle implements Shape;
	declare parents : Rectangle implements Shape;
	
	/**
	 * captures the circle as it is constructed
	 * @param c
	 */
	pointcut circle(Circle c): 
		execution(Circle.new(double)) &&
		this(c);
	
	/**
	 * captures the rectangle as it is constructed
	 * @param r
	 */
	pointcut rectangle(Rectangle r): 
		execution(Rectangle.new(double, double)) &&
		this(r);
	
	/**
	 * passes the circle's radius to the aspect's radius, so that it can be used later
	 * @param c
	 */
	before(Circle c): circle(c) {
		this.radius = c.radius;
	}
	
	/**
	 * passes the rectangles parameters to the aspects params, so that it can be used later
	 * @param r
	 */
	before(Rectangle r): rectangle(r) {
		this.width = r.width;
		this.height = r.height;
	}
	

	/**
	 * calls getName to create a toString function
	 * @return string with rectangle details
	 */
	public String Rectangle.toString()
	{
		return this.getName() + "(" + this.width + ", " + this.height + ")"; 
	}
	
	/**
	 * calls GetName to create a toString function
	 * @return string with circle details
	 */
	public String Circle.toString()
	{
		return this.getName() + "(" + this.radius + ")"; 
	}

}
