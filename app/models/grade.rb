class Grade
    attr_reader :name, :score
    include Comparable


    SCORES = {
        'A' => 4.0,
        'B+' => 3.3,
        'B' => 3.0,
        'C+' => 2.3,
        'C' => 2.0,
        'D' => 1.0,
        'F' => 0.0
      }



    def initialize(name, score=nil)
        @name = name
        @score = score
    end

    #factory method
    def self.to_grade(value)
        return value if value.is_a?(Grade)
        new(value)
        Grade.all.find {|grade| grade.name == value} || raise("Couldn't find grade '#{value}'") unless value.nil?
    end

    def <=>(other)
        score <=> Grade.to_grade(other)&.score
    rescue ArgumentError
    end

    def self.all
        @all ||= SCORES.map do |name, score|
            new(name, score)
        end
    end

    #methods that serialize requires
    
    def self.dump(value)
        # Converts the grade object to a storable format (usually a string)
        return unless value
        to_grade(value).name
    end

    def self.load(value)
        # Converts the stored data back to a grade object
        # `data` here would be whatever the dump method returned
        return unless value
        to_grade(value)
    end




    def score
        # SCORE[NAME]
        SCORES.fetch(name)
    end



    def at_least?(other)
        name <= other
        self >= other
    end


   
    def as_json(*)
        name
    end

    def to_s
        name
    end
end