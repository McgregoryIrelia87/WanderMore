# A Travel Agency Program

#Travel Agency class definition
class TravelAgency
  attr_accessor :name, :location, :destinations, :services
 
  # constructor method
  def initialize(name, location)
    @name = name
    @location = location
    @destinations = []
    @services = []
  end 
  
  #accessor methods
  def get_name
    @name
  end
  
  def get_location
    @location
  end
  
  def get_destinations
    @destinations
  end
  
  def get_services
    @services
  end
  
  # mutator methods
  def set_name(name)
    @name = name
  end
  
  def set_location(location)
    @location = location
  end
  
  def add_destination(destination)
    @destinations << destination
  end
  
  def add_service(service)
    @services << service
  end
  
  #other methods
  def list_destinations
    puts "The following destinations are available:"
    @destinations.each_with_index do |destination, index|
    puts "#{index+1}) #{destination}"
  end
end

def list_services
  puts "The following services are available:"
  @services.each_with_index do |service, index|
    puts "#{index+1}) #{service}"
  end
end

def plan_vacation
  puts "What type of vacation are you looking for?\nEnter '1' for an exotic adventure or '2' for a relaxing getaway:"
  type = gets.chomp.to_i
  
  if type == 1
    puts "Please select your desired excotic adventure:"
    list_destinations
    destination = gets.chomp.to_i
    puts "Excellent choice! What additional services would you like to add for your excotic adventure?"
    list_services
    service = gets.chomp.to_i
  elsif type == 2
    puts "Please select your desired relaxing getaway:"
    list_destinations
    destination = gets.chomp.to_i
    puts "Excellent choice! What additional services would you like to add for your relaxing getaway?"
    list_services
    service = gets.chomp.to_i
  else
    puts "Invalid choice. Please enter a valid option."
    plan_vacation
  end
end

def confirm_vacation
  puts "Is the following vacation correct? \nDestination: #{@destinations[destination - 1]}\nServices: #{@services[service - 1]}"
  confirmation = gets.chomp
  
  if confirmation == "yes"
    puts "Thank you! Your vacation has been booked!"
  else
    puts "Let's plan your vacation again."
    plan_vacation
  end
end

end

#Client class definition
class Client 
  attr_accessor :name
 
  # constructor method
  def initialize(name)
    @name = name
  end
  
  #accessor methods
  def get_name
    @name
  end
  
  #mutator methods
  def set_name(name)
    @name = name
  end
end

#Driver code
#Create a new Travel Agency 
vacations_R_us = TravelAgency.new("Vacations R Us", "New York City")

#Add destination to Travel Agency
vacations_R_us.add_destination("Fiji")
vacations_R_us.add_destination("Bali")
vacations_R_us.add_destination("Maldives")

#Add service to Travel Agency
vacations_R_us.add_service("Transportation")
vacations_R_us.add_service("Accomodation")
vacations_R_us.add_service("Activities")

#Create a Client
client1 = Client.new("Jim")

#Plan vacation
puts "Welcome to #{vacations_R_us.name}, #{client1.name}!"
vacations_R_us.plan_vacation
vacations_R_us.confirm_vacation