class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            user.tickets>= attraction.tickets && user.height >= attraction.min_height 
            user.tickets = user.tickets - attraction.tickets 
            user.nausea = user.nausea + attraction.nausea_rating 
            user.happiness = user.happiness + attraction.happiness_rating 
            user.save 
            "Thanks for riding the #{self.attraction.name}!"
            
        end
    end
end
