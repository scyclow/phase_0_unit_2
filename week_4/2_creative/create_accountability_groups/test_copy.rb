#I figured this out in my office; have a collection of business cards; layed them out in front of me in group of four.
#I figure you need at least four groups of four to ensure no repetitions. For example, if you only have three groups, then you could take person 1 from group 1, and pair them with three people from separate groups…but you’d have to pick two people from the same group. 
#Looking at the 4x4 grid, you see that one group goes up/down. Then, you can make four separate left/right groups. The third group is a bit trickier. Using person 1,1 as an example, you’ve eliminated all people in the top row and left-most column. So to create one more unique group of four, you could go diagonally. 
#If you have a list of people, you can represent it as:
#First, separating into four groups of four, randomly.
#Then, using steps of 4.
#Then, using steps of 5.
#After playing around with the cards, the remainders confused me a bit. One way around this is to take the remainders and put them in a separate group. 

#split list into groups of four; take remainders and add them to groups 1,2,3 = unit 1
#step = group1 size
#flatten entire cohort
#iterate through legacy group1 (using step). Create new group of four based on step (ex. If legacy group 1 has 5 members, choose person 0, person 5, 10, person 14; if legacy group1 has 4 people, new group one should have person 0, 4, 8, 12; take remainder, add them to new group -1, -2, -stud3. 
#iterate through unit2 group 1 using same method, except step+1



def accountable(student_list)
    #student_list.shuffle!
    
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
    units
end






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

accountable(student_list)
