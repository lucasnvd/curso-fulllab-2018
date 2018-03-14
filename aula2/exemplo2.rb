require 'faker'

# ------------------------------------------------------------------------ #
# Utilizando módulos.
# ------------------------------------------------------------------------ #
#
#
#
# ------------------------------------------------------------------------ #
module Vehicle
  attr_accessor :brand, :color, :year

  def self.included(base)
    base.extend(ClassMethods)
  end

  def show_vehicle_brand
    puts "Name: #{brand}"
  end

  def show_vehicle_year
    puts "Year: #{year}"
  end

  module ClassMethods
    def create_new_vehicle
      new.tap do |v|
        v.brand = Faker::Vehicle.manufacture
        v.color = Faker::Color.color_name
        v.year  = Faker::Number.between(1970, 1999)
      end
    end

    def create_many_vehicles
      1.upto(100).map { create_new_vehicle }
    end
  end
end

class Car
  include Vehicle
end

car = Car.create_new_vehicle

puts 'Displaying vehicle 1 brand'
car.show_vehicle_brand

car2 = car.class.create_new_vehicle

puts 'Displaying vehicle 2 brand'
car2.show_vehicle_brand

cars = Car.create_many_vehicles

cars.each do |car|
  car.show_vehicle_year
end
