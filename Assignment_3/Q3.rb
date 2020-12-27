require_relative "Q1.rb"

# straight up "borrowed" this function from stack overflow. Not sure if Ali will lose his mind about "plagarism" because of it
def is_number? string
    true if Float(string) rescue false
end

contents = IO.readlines("inputs.txt")

i = 0

#declaring the global variables to keep count
$shapes = 0
$rectangles = 0
$circles = 0
$ellipses = 0

while i < contents.length() do
    line = contents[i].split
    
    shape = line[0]
    
    case shape
        when "shape"
            s = Shape.new()
            #increasing the shape count
            $shapes += 1
            puts s.print
            
        when "rectangle"
            if !is_number?(line[1]) or !is_number?(line[2]) or line[1].to_f<0 or line[2].to_f<0
            puts "Error: Invalid Rectangle"
            i = i + 1
            $shapes += 1
            $rectangles += 1
            next
            end
        
            r = Rectangle.new(line[1].to_f, line[2].to_f)
            #increasing the shapes and rectangles count
             $shapes += 1
             $rectangles += 1
            puts r.print
        
        when "circle"
            
            if !is_number?(line[1]) or line[1].to_f<0
            puts "Error: Invalid Circle"
            i = i + 1
            $shapes += 1
            $circles += 1
            next
            end
            
            c = Circle.new(line[1].to_f)
            #increasing the shapes and circle count
            $shapes += 1
            $circles += 1
            puts c.print
        
        when "ellipse"
            if !is_number?(line[1]) or !is_number?(line[2]) or line[1].to_f<0 or line[2].to_f<0
            puts "Error: Invalid Ellipse"
            i = i + 1
            $shapes += 1
            $ellipses += 1
            next
            end
            
            e = Ellipse.new(line[1].to_f, line[2].to_f)
            #increasing the shapes and ellipses count
            $shapes += 1
            $ellipses += 1
            puts e.print
    
        else
            puts ""
    end
    
    i = i + 1
end

puts " "
puts " "

#starting part q3
hash_array = {"Shape(s)" => $shapes, "Rectangle(s)" => $rectangles, "Circle(s)" => $circles, "Ellipse(s)" => $ellipses }
puts "Statistics:"
hash_array.each_pair do |key, value|
  puts "\t#{key}: #{value}"
end  
