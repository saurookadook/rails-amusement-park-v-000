class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      "Sorry. " + self.tickets_error(@attraction) + " " + self.height_error(@attraction)
    elsif @user.tickets < @attraction.tickets
      "Sorry. " + self.tickets_error(@attraction)
    elsif @user.height < @attraction.min_height
      "Sorry. " + self.height_error(@attraction)
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      "Thanks for riding the #{@attraction.name}!"
    end
  end

  def tickets_error(attraction)
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_error(attraction)
    "You are not tall enough to ride the #{attraction.name}."
  end
end
