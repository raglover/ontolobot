class User

    attr_accessor :name
    attr_accessor :odollars

    def initialize(attributes={})
        attributes.each do |attribute, value|
            setter = "#{attribute}="
            self.send(setter, value) if self.respond_to?(setter)
        end
    end

    def add 
        response = $db.zincrby('lders', @odollars, @name)
    end

    def subtract
        response = $db.zincrby('lders', -(@odollars.to_i), @name)
    end

    def self.leaders
        response = $db.zrevrange('lders', 0, 2, with_scores: true)
    end

end
