# Your Names
# 1)Danielle Sublett
# 2)Steve Pikelny

 # This is the file you should end up editing. 
 
def bakery_num(num_of_people, fav_food)
  available_servings = {"pie" => 8, "cake" => 6, "cookie" => 1}
  fav_food_servings = available_servings[fav_food] 

  raise ArgumentError.new("You can't make that food") unless available_servings.has_key?(fav_food)
                   
  if num_of_people % fav_food_servings == 0
    return "You need to make #{num_of_people / fav_food_servings} #{fav_food}(s)."  
  end
  
  if fav_food == "pie"
    pie_qty = num_of_people / available_servings["pie"]
    people_left = num_of_people % available_servings["pie"]
    cake_qty = people_left / available_servings["cake"]
    cookie_qty = people_left % available_servings["cake"] 
  elsif fav_food == "cake" 
    pie_qty = 0
    cake_qty = num_of_people / available_servings["cake"]
    cookie_qty = num_of_people % available_servings["cake"]
  elsif fav_food == "cookies" 
    pie_qty, cake_qty = 0, 0
    cookie_qty = num_of_people
  end
  
  return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
 
end


#-----------------------------------------------------------------------------------------------------
#DRIVER TEST CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver test code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
 


#  Reflection 
# The GPS went well, but I feel like it took us a lot longer to come up with a refactored answer than it should have...and we probably could have done a better job.
# I think we made a mistake by trying to go through the code line-by-line to figure out what was going on. By doing that, we ended up refactoring a lot of stuff that we ende dup taking out. 
# A more effective strategy probably would have been to take a step back, skim the entire code, and have a dicussion abotu what we think it's supposed to do. 
# That said, we were pretty effective once we hit our stride. We pseudocoded a big section of the solution a few times, each time getting more specific until we winded up with real code.
# I think one potential way we could have made the code look less ugly is by using classes. 