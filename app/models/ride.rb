class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = []
    message << "You do not have enough tickets the #{attraction.name}." if user.tickets < attraction.tickets
    message << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    return message.unshift("Sorry.").join(" ") if !message.empty?
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
    message = "Thanks for riding the #{attraction.name}!"
  end
end
