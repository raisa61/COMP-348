

public aspect aspect_q4 {
	
	/**
	 * declaring the shape interface as the parent of the Circle and the Rectangle class
	 */
	declare parents : Circle implements Shape;
	declare parents : Rectangle implements Shape;

	/**
	 * declaring the getName method for the Rectangle class
	 * @return Rectangle
	 */
	public String Rectangle.getName()
	{
    	return "Rectangle";
	}
	
	/**
	 * declaring the getName method for the Circle class
	 * @return Circle
	 */
	public String Circle.getName()
	{
    	return "Circle";
	}
}
