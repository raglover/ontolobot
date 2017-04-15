class User < ActiveRecord::Base
    has_many :ontolodollars, dependent: :destroy

    def dollar_total
        self.ontolodollars.map { |odollars| odollars['odollars']}.reduce(0, :+)
    end

    def full_name
        "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end

    def self.leaders
        array = User.all.sort_by {|u| u.dollar_total}
        array = array.reverse
        array[0..2]
    end
end
