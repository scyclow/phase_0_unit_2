# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself, with: ].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
  alphabet = ('a'..'z').to_a        #creates an array of each lowercase letter from a to z.
  cipher = Hash[alphabet.zip(alphabet.rotate(4))]       #alphabet.rotate(4) creates a new array, where the 4th index item shifts to the 0th place
                                                        # zip creates a 2 dimensional array, where alphabet is the 0th item, and the rotated array is the second item
                                                        #cipher is a new hash where alphabet is the key, and the rotated array is the value.
  spaces = ["@", "#", "$", "%", "^", "&", "*"]    #you don't need to assign a variable to this array...it's only called once
  
  original_sentence = sentence.downcase       #this isn't neccessary either...just downcase original_sentence when it is called.
  encoded_sentence = []         # creates an empty container for the encoded sentence
  original_sentence.each_char do |element|    #iterates through the original sentence.
    if cipher.include?(element)               # if element is the cipher hash...
      encoded_sentence << cipher[element]     #shove the encoded character into the encoded sentence container
    elsif element == ' '            # if the non-encoded character is a space
      encoded_sentence << spaces.sample #throw a random symbol into the encoded sentence
    else 
      encoded_sentence << element #if the elements isn't a space or lowercase letter, just add the element.
    end
  end
    
  return encoded_sentence.join #don't need the explicit return
end


# Questions:
# 1. What is the .to_a method doing?
    # Turns the range into an array containing each element within the range.

# 2. How does the rotate method work? What does it work on?
    # rotate basically shifts everything in the array over to the left by the amount specified. 

# 3. What is `each_char` doing?
    # it turns a string into an enumerable. You wouldn't be able to iterate over a string without this.

# 4. What does `sample` do?
    # picks out a random element from the array.

# 5. Are there any other methods you want to understand better?
    #Everything here is pretty self-explanitory.

# 6. Does this code look better or worse than your refactored solution
    # This code is a little sloppy, espescially with spaces and tabs. 

#    of the original cipher code? What's better? What's worse?
# 7. Is this good code? What makes it good? What makes it bad?
    #It's okay. It's fairly self explanitory. I didn't have any trouble figuring out what it's doing. 
    # I don't think it's really necessary to create a new hash though. Good algorithm design would make this unnecessary. It's also probably computationally expensive.


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")


# 5. Reflection 
# Not much particularly new here. I learned about a couple new methods, though. Rotate and sample are kind of interesting.
# I learned abotu each_char after talking to someone else in my accountability group, though. I think that's a neat method. I was wondering if you could iterate over a string when I originally looked at the problem; and then I saw that I couldn't do it directly. I'll definitely use each_char in the future.

