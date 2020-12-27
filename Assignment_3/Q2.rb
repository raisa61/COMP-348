require_relative "Q1.rb"

# straight up "borrowed" this function from stack overflow. Not sure if Ali will lose his mind about "plagarism" because of it
def is_number? string
    true if Float(string) rescue false
end

contents = IO.readlines("inputs.txt")

i = 0

while i < contents.length() do
    line = contents[i].split
    
    shape = line[0]
    
    case shape
        when "shape"
            s = Shape.new()
            puts s.print
            
        when "rectangle"
            if !is_number?(line[1]) or !is_number?(line[2]) or line[1].to_f<0 or line[2].to_f<0
            puts "Error: Invalid Rectangle"
            i = i + 1
            next
            end
        
            r = Rectangle.new(line[1].to_f, line[2].to_f)
            puts r.print
        
        when "circle"
            
            if !is_number?(line[1]) or line[1].to_f<0
            puts "Error: Invalid Circle"
            i = i + 1
            next
            end
            
            c = Circle.new(line[1].to_f)
            puts c.print
        
        when "ellipse"
            if !is_number?(line[1]) or !is_number?(line[2]) or line[1].to_f<0 or line[2].to_f<0
            puts "Error: Invalid Ellipse"
            i = i + 1
            next
            end
            
            e = Ellipse.new(line[1].to_f, line[2].to_f)
            puts e.print
    
        else
            puts ""
    end
    
    i = i + 1
end
