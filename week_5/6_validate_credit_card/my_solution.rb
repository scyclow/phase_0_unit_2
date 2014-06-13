# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge with: Casey Ryan

# 2. Pseudocode

# Input: card_number
# Output: true or false when check_card is called
# Steps: 1. intialize the object with card_number
# 2. store card_number as an instance variable
# 3. create first method, turn_to_array
# 4. turn_to_array: take card_number, turn to string, split into digits, iterate with each turning values to integer
# 5. create second method, double
# 6. double: reverse array, map with index, double every odd indexed number, reverse array back
# 7. create third method, sum_digits
# 8. sum_digits: iterate through, find double digit values, call turn_to_array, flatten resulting array, sum values from array using inject
# 9. create third method, check_sum
# 10. check_sum: take whats returned from sum_digits and sees if % 10 is equal to 0, then return true
# 11. last method, check_card
# 12. call turn_to_array, double, sum_digits, and check_sum 


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
<<-INITIAL
class CreditCard
    def initialize(card_number)
        raise ArgumentError.new("Not initialized properly") unless card_number.to_s.length == 16
        @card_number = card_number  
    end
    
    def check_card
        check_sum(sum_digits(double(turn_to_array(@card_number))))
    end
    
    private 
    
    def turn_to_array(number)
        number.to_s.split("").map(&:to_i)
    end
    
    def double(arr)
        arr.reverse.map.with_index{|x, i| if i.odd? then x*2 else x end}
    end
    
    def sum_digits(arr)
        arr.map{|x| if x > 9 then turn_to_array(x) else x end}.flatten.inject(:+)
    end
    
    def check_sum(sum)
        sum % 10 == 0
    end
end
INITIAL

# 4. Refactored Solution
class CreditCard
    def initialize(card_number)
        raise ArgumentError.new unless card_number.to_s.length == 16
        @card_number = card_number
    end
    
    def check_card       
        check_sum( sum_digits( double_every_other( prep(@card_number))))
    end
    
    private 
    
    def prep(number)
        number.to_s.split('').map(&:to_i)
    end
    
    def double_every_other(arr)
        arr.reverse.map.with_index { |x, i| i.odd? ? x*2 : x}
    end
    
    def sum_digits(arr)
        arr.map{|x| x > 9 ? prep(x) : x}.flatten.inject(:+)
    end
    
    def check_sum(sum)
        sum % 10 == 0
    end
end





# 1. DRIVER TESTS GO BELOW THIS LINE
begin
    CreditCard.new(11111111111111112) 
rescue ArgumentError
    true
end

begin
    CreditCard.new(1) 
rescue ArgumentError
    true
end

CreditCard.new(4408041234567893).check_card == true

CreditCard.new(4408041234567892).check_card == false




# 5. Reflection 
# This one was also pretty fun. I'm still trying to figure out how to refactor the solution a bit more. Having all the chained methods is kind of ugly. 
# I'm also not a huge fan of calling methods inside methods. I originally tried manipulating an instance variable inside each method instead of defining a parameter. But that didn't work. 
# Even when I tried making the methods destructive, the instance variable didn't remember the change. I'll have to look into this a bit more.