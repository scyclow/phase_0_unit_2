# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [with: George Xiangwen Zeng].


# 2. Pseudocode

# As a video game player, I want to be able to create a new car and set it's model and color so I can customize it in the video game.
# As a video game player, I need to be able to define a distance to drive so I can follow directions appropriately.
# As a video game player, I'd like to be able to see the speed I am traveling, so I can properly accelerate or decelerate.
# As a video game player, I want to be able to turn left or right so I can navigate a city and follow directions.
# As a video game player, I want to be able to accelerate and decelerate the car to a defined speed so I can drive following the rules of the road.
# As a video game player, I want to keep track of the total distance I have travelled, so I can get paid for mileage.
# As a video game player, I want to be able to stop the car so I can follow traffic signs and signals.
# As a video game player, I would like to see output reflecting the latest action of my car so I can see a play-by-play of the pizza delivery.

# create a Car class
    # initialize with attributes of color, model, 
        #speed, x_traveled=0, y_traveled=0, direction=north, time=0, distance=0
    
    #def drive (distance)
        #case direction
        #when north; add to y_traveled
        #when west; subtract from x_traveled
        #when south; subtract from y_traveled
        #when east; add to x_traveled
        #Add find_time to @time
        
    #def turn (left_or_right)
        #case direction
        #when north; left =>west; right=>east
        #when west; left =>south; right=>north
        #when south; left =>east; right=>west
        #when east; left =>north; right=>south
        
    #def change_speed 
        #increasese or decreases current speed
    
    #def stop
        #takes speed down to 0
    
    #def display
        #prints out latest action
        
    #def displacement x, y
        # sqrt(x^2 + y^2)
        
    #private
    #find_time (distance, speed)
        #distance/speed
        
        
# 3. Initial Solution
# class Car
#     attr_accessor :speed, :total_distance, :x_traveled, :y_traveled, :time
    
#     def initialize(color, model)
#         @color = color
#         @model = model
#         @speed = 0
#         @x_traveled = 0
#         @y_traveled = 0
#         @direction = :north
#         @time = 0
#         @total_distance = 0
#     end

#     def drive(distance)
#         case @direction
#         when :north then @y_traveled += distance
#         when :west then @x_traveled -= distance
#         when :south then @y_traveled -= distance
#         when :east then @x_traveled += distance
#         end
        
#         @total_distance += distance
        
#         @time += distance/@speed
        
#         puts "You just drove #{distance} miles #{@direction}"
#     end
    
#     def turn(change)
#         case @direction
#         when :north
#             if change == :right then @direction = :east
#             elsif change == :left then @direction = :west
#             end
#         when :west 
#             if change == :right then @direction = :north
#             elsif change == :left then @direction = :south
#             end
#         when :south 
#             if change == :right then @direction = :west
#             elsif change == :left then @direction = :east
#             end
#         when :east 
#             if change == :right then @direction = :south
#             elsif change == :left then @direction = :north
#             end
#         end
#         puts "You just turned #{change}. You are now facing #{@direction}"
#     end

#     def displacement
#         Math.sqrt(@x_traveled**2 + @y_traveled**2)
#     end

# end

# 4. Refactored Solution

class Car
    attr_accessor :speed, :total_distance, :x_traveled, :y_traveled, :time
    
    def initialize(color, model)
        @color = color
        @model = model
        @speed = 0
        @x_traveled = 0
        @y_traveled = 0
        @direction = :north
        @time = 0
        @total_distance = 0
        @direction_index = 0
    end

    def drive(distance)
        case @direction
        when :north then @y_traveled += distance
        when :west then @x_traveled -= distance
        when :south then @y_traveled -= distance
        when :east then @x_traveled += distance
        end
        
        @total_distance += distance
        
        @time += distance/@speed
        
        puts "You just drove #{distance} miles #{@direction}"
    end
    
    def turn(change)
        direction_array = [:north, :east, :south, :west]
        case change
          when :right then @direction_index +=1
          when :left then @direction_index -=1
        end
        @direction = direction_array[@direction_index%4]
        puts "You just turned #{change}. You are now facing #{@direction}"
    end

    def displacement
        Math.sqrt(@x_traveled**2 + @y_traveled**2)
    end
end

# 1. DRIVER TESTS GO BELOW THIS LINE

new_car = Car.new("red", "ferrari")
new_car.speed=25
new_car.drive(0.25)
new_car.turn(:right)
new_car.speed=35
new_car.drive(1.5)
new_car.speed=15
new_car.drive(0.25)
new_car.turn(:left)
new_car.speed=35
new_car.drive(1.4)
new_car.speed=0
p new_car.total_distance.round(1) == 3.4
p new_car.displacement.round(1) == 2.4
p (new_car.time*60).round(1) == 6.6
p new_car.x_traveled
p new_car.y_traveled

def assert(expected, actual, message)
  display message 
  p expected.round(1)==actual.round(1) || display_error(actual, expected)
end

def display_error actual, expected
  p "ERROR - expected #{expected} but got #{actual} instead"
end

def display message
  p "*"*50
  p message
  p "*"*50
end

assert(3.4, new_car.total_distance, "Traveled the expected distance")
assert(2.4, new_car.displacement, "Traveled the expected displacement")
assert(6.6, new_car.time*60, "Traveled the expected time")





# 5. Reflection 
##A+++
# This challene was pretty fun to pair on. 
#I feel like some of the class-based things this week can get somewhat tedious. It's not very difficult to get the desired functionality, but it requires a lot of typing to add everything, and then to test everything. Working with someone else made it more fun.
# In any case, this was a good challenge for getting practice with methods that interact with instance variables.