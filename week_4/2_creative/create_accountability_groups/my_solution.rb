# U2.W4: Create Accountability Groups


# I worked on this challenge [with:  Michael Kirlin].

# 2. Pseudocode

# Input: array of students
# Output: a hash containing three units, each with a list of groups. No two students should ever be in the same group.
# Steps:

#define function accountable, which takes student list.
	# Create a hash with keys for units 1, 2, and 3
	# For unit 1:
		# split the list into groups of four. 
		# Put any remainders into groups 0, 1, and 2, as applicable.
	#For unit 2:
		#Create a 2-dimensional array...that is, an array of empty array. The number of empty arrays should equal the amount of groups in unit 1.
		#The 0th member of group 0 should stay in unit2 group 0. The 1st member should go to unit 2 group 1. The 2nd should go to unit 2 group 2, etc.
		#Do this by iterating over each group in unit 1...
			#Then iterate over each member of the group. 
				#This member's target group should == member index + group index
				#if the target group > number of groups, then subtract number of groups (ex. if unit 1 has 6 groups, student 4 of group 5 should have a target group of 3)
				#add the student to the target group of unit 2
	# For unit 3:
		#Do the same as in unit 2, but in the opposite direction
		#Create a 2-dimensional array. The number of empty arrays should equal the amount of groups in unit 1.
		#The 0th member of group 0 should stay in unit2 group 0. The 1st member should go to unit 2 group -1. The 2nd should go to unit 2 group -2, etc.
		#Do this by iterating over each group in unit 1...
			#Then iterate over each member of the group. 
				#This member's target group should == group index - member index
				#if the target group < 0 number of groups, then the syntax should pick it up. (ex. if unit 1 has 6 groups, student 1 of group 0 should have a target group of -1)
				#add the student to the target group of unit 3


# 3. Initial Solution
=begin
def accountable(student_list)
    student_list.shuffle!
    
    units = {
       1 => [],
       2 => [],
       3 => []
    }
    
    #splits groups into units of fours, adds to first unit
    student_list.each_slice(4) {|group| units[1] << group}
    
    # adds students in any group smaller than 4 to other groups
    if units[1][-1].size < 4
        units[1][-1].each_index do |index| 
            units[1][index] << units[1][-1][index]
        end
        #I can't figure out how to drop the last array
        units[1] = units[1][0...-1]
    end
    
    #create new arra
    units[2] = Array.new(units[1].size) {[]}
    units[1].each_with_index do |group, group_i|
        group.each_with_index do |student, student_i|
            if group_i+student_i < units[1].size
                target_group = group_i+student_i
            else
                target_group = (group_i+student_i)-units[1].size
            end
            units[2][target_group] << student
        end
    end

    units[3] = Array.new(units[1].size) {[]}
    units[1].each_with_index do |group, group_i|
    	group.each_with_index do |student, student_i|
    		target_group = group_i - student_i
    		units[3][target_group] << student
    	end
    end

    units
end

=end


# 4. Refactored Solution

def accountable(student_list)
    units = {1 => []}

    student_list.shuffle!
    student_list.each_slice(4) {|group| units[1] << group}
    if units[1].last.size < 4
        units[1].last.each_index do |index| 
            units[1][index] << units[1].last[index]
        end.delete_at(-1)
    end
    num_groups = units[1].size

    units[2] = Array.new(num_groups) {[]}
    units[1].each_with_index do |group, g_ix|
        group.each_with_index do |student, s_ix|
            target_group = (g_ix + s_ix < num_groups) ? (g_ix + s_ix) : (g_ix + s_ix - num_groups)
            units[2][target_group] << student
        end
    end

    units[3] = Array.new(num_groups) {[]}
    units[1].each_with_index do |group, g_ix|
    	group.each_with_index do |student, s_ix|
    		target_group = g_ix - s_ix
    		units[3][target_group] << student
    	end
    end

    units
end






# 1. DRIVER TESTS GO BELOW THIS LINE

student_list = %w{
Dakota Cousineau
Casey Ryan
Clayton Jordan
William Davis
David Nanry
Dev Deol
Duke Greene
Edgar Garza
Stephanie Chou
Joey Sabani
Joseph Hendele
Kajal Agarwal
Krystyna Ewing
Grace Yim
Jeff Keslin
Jennie Chamberlin
Joey Chamberlin
Lovinder Pnag
Maria Magdalena 
Ang Bejar
Michael Daugherty
Michael Kirlin
Robert Schwartz
Sebastian Caso
Sebastian Radloff
Steven Pikelny
Neel Shah
}.each_slice(2).map{|student| "#{student[0]} #{student[1]}"}

units = accountable(student_list)

units.size == 3

units.each {|unit| unit.flatten.size == student_list.size}

units[1].each {|group| group.size <=5 && group.size > 3}
units[2].each {|group| group.size <=5 && group.size > 3}
units[3].each {|group| group.size <=5 && group.size > 3}

#I forgot to write the driver code before the solition. sorry.
#I can't figure out how to test to make sure that students are in different groups each time



# 5. Reflection 

# I originally wrote some pseudocode for this exercise, and ended up scrapping a lot of the ideas. So, I ended up writing the pseudocode here after coding for a while and formulating a better game plane.
# It took me a long time to figure out a good algorithm for mixing the groups up such that no student is in the same group with any other students twice. I spent some time thinking about this in my office, and tried to visualize it by making a grid with business cards and moving them around.
# I actually had an easier time figuring out the best algorithm once I started typing code. It's surprisingl hard to pseudocode. Pseudocode is vague by definition, which makes it hard to keep track of all the variables.
# When working on the initial solution, I ran into a major problem in the syntax for unit 2, which took several hours of debugging. I paired with Michael Kirlin for nearly two hours, and neither of us could figure out what was going wrong. 
# Eventually, I figured out that I made a syntactical error when setting up empty arrays for unit 2. Apparently, []*X creates the SAME array X times, rather than X different arrays. 
# In all, I think explaining the problem to someone else helped me clarify my thinking on the matter.
# I also had some trouble with the driver tests. I don't know how to test whether there is any group overlap without taking an object oriented approach.

