class Grade
    attr_reader :name

    #factory method
    def self.to_grade(value)
        return value if value.is_a?(Grade)
        return new(value)
    
    end


    def initialize(name)
        @name = name
    end

    def at_least?(other)
        name <= other
    end

   

end