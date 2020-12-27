include Math
class Shape
    def initialize
    end
    def print
        return "Shape, perimeter: undefined, area: undefined"
    end
    def perimeter
        return nil
    end
    def area
        return nil
    end
end

class Rectangle < Shape
    @@h
    @@w
    def initialize (h, w)
        super()
        if h.instance_of?(String) or w.instance_of?(String)
            @@h = 0
            @@w = 0
        else
            @@h = (h).abs
            @@w = (w).abs
        end
    end
    def print
        return "Rectangle, perimeter: #{self.class.perimeter}, area: #{self.class.area}"
    end
    def self.perimeter
        return 2*(@@h+@@w)
    end
    def self.area
        return @@h*@@w
    end
end

class Circle < Shape
    @@r
    def initialize (r)
        super()
        if r.instance_of?(String)
            @@r = 0
        else
            @@r = (r).abs
        end
    end
    def print
        return "Circle, perimeter: #{self.class.perimeter}, area: #{self.class.area}"
    end
    def self.perimeter
        return 2*PI*@@r
    end
    def self.area
        return PI*@@r**2
    end
end

class Ellipse < Shape
    @@a
    @@b
    def initialize (a, b)
        super()
        if a.instance_of?(String) or b.instance_of?(String) then
            @@a = 0
            @@b = 0
        elseif (a).abs >= (b).abs
            @@a = (a).abs
            @@b = (b).abs
        else
            @@a = (b).abs
            @@b = (a).abs
        end
    end
    def print
        return "Ellipse, perimeter: undefined, area: #{self.class.area}"
    end
    def self.area
        return PI*@@a*@@b
    end
    def eccentricity
        return (@@a**2 - @@b**2)**0.5
    end
end

