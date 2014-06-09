# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
	source.select{|i| i.to_s.include? thing_to_find}
end

def my_hash_finding_method(source, thing_to_find)
    source.select{|k, v| v == thing_to_find}.keys
end

# Identify and describe the ruby method you implemented. 
# I implemented the each method. First I thought I was going to need an
# include method, but then I realized to output these values, I would need 
# to first iterate over them. The each method works as an iterator. 

# Person 2
def my_array_modification_method(source, thing_to_modify)
    source.each_with_index do |value, index|
        if value.is_a? Integer
           source[index] += thing_to_modify
        end
    end
end


def my_hash_modification_method(source, thing_to_modify)
    source.each_with_index do |(key, value), index|
        source[key] = value + thing_to_modify
	end
end

# Identify and describe the ruby method you implemented. 

# my_array_modification_method
# .map!: takes two arguements, the element and the block. It modifies the array changes each element of 
# 	     the array with the value returned by the block
# .is_a?: checks for the class of the object in question. In this case I'm checking whether an element 
# 		  within the array is an integer. If so, it will increase by the value entered in thing_to_modify
# 		  If the element is not an integer, the block returns the original element back into the array. 

# my_hash_modification_method 
# .each: also takes in two arguements representing each key and value of the hash. 
#	     source[k] calls each of the key in the hash and modifies their values by what is entered for 
#		 thing_to_modify


# Person 3
def my_array_sorting_method(source)
	source.collect{|x| x.to_s}.sort
	puts source
end

def my_hash_sorting_method(source)
	source.sort_by{|k, v| v }
	puts source
end

# Identify and describe the ruby method you implemented. 

# For my array sorting method, I used three ruby methods:
# .collect: .collect returns a new array. Typically, you follow .collect with a block, and the array it returns is the original input array with the effects of this block applied to it.
# .to_s: I used .to_s as the block for collect. This converted every element of the array to a string and let me sort them.
# .sort: .sort sorts every item in an array alphabetically. It only works on strings, though, which is why the original array had to be changed.

# .sort_by: This method lets you pick what aspect of the hash you want to sort by. You simply give the method a block with the directions for what you want to sort the hash by and then run it.

# For both of these, I was writing them before the modifications had been made, so I got false results, but when I ran them in irb, I was able to visually match the output to what was required.


# Person 4
def my_array_deletion_method(source, thing_to_delete)
	source.delete_if {|i| i.to_s.include? thing_to_delete}
end

def my_hash_deletion_method(source, thing_to_delete)
	source.delete_if {|k, v| k == thing_to_delete}
end

# Identify and describe the ruby method you implemented. 
# delete_if iterates through the source, deletes all objects that evaluate to true in the block, and spits out the new source.
# As with most enumerables, the block takes a key and value if called on a hash.
# reject accomplishes a similar goal, but is non-destructive (it returns a new array/hash, rather than the existing one), and returns nil if no changes were made.
# reject! is destructive, but also returns nil if no changes were made.
# Alternatively, find_all does the opposite of reject; it returns all objects that evaluate to true. 



################## DRIVER TEST CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
# This was a good excuse to browse the ruby docs. I came across a couple interesting looking methods while looking for delete_if. 
# I couldn't find any methods that did 100% of the work, but delete_if does the mheavy lifting. I still had to fudge it a bit by passing it a block containing a method or two. 
# 
# 
# 
