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




# 4. Refactored Solution








# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 

# I originally wrote some pseudocode for this exercise, and ended up scrapping a lot of the ideas. So, I ended up writing the pseudocode here after coding for a while and formulating a better game plane.
# 
