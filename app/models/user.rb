class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if admin == false
            if nausea > happiness 
                return "sad"
            else
                return "happy"
            end
        end
    end
end
