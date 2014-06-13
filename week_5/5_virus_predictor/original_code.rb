# U2.W5: Virus Predictor

# I worked on this challenge [by myself, with: ].

# EXPLANATION OF require_relative
#
#
require_relative 'state_data' # require_relative is a way of requiring a file by entering its file path relative to the current file. 
                              # The hash sorts data by state, whith each state containing a population density, a population, a region, and a regional spread.
                              # There is no difference in the hash syntax. The symbol syntax is easier to type, and looks better as a sub-hash, in my opinion.
class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread) # initializes the state. Turns the state's data into instance variables, which are accessible throughout the object's methods.
    @state = state_of_origin
    @population = population
    @population_density = population_density
    #@region = region
    #@next_region = regional_spread     <___These are never used, but might be used in the future
  end

  def virus_effects  # calls the predicted_deaths and speed_of_spread methods using the state's instance variables.  
    print "#{@state} will lose #{predicted_deaths} people in this outbreak"
    puts " and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private  # everything below this point is only accessible internally. Other object methods have access to these methods, but they are not accessable to anything outside the object.
            
  def predicted_deaths #estimates the number of deathes based on population density
    case @population_density
    when 0...50 then (@population * 0.05).floor
    when 50...100 then (@population * 0.1).floor
    when 100...150 then (@population * 0.2).floor
    when 150...200 then (@population * 0.3).floor
    else (@population * 0.4).floor
    end
  end

  def speed_of_spread #estimates the speed of the spreading disease based on population density.                                             
    case @population_density    
    when 0...50 then 2.5
    when 50...100 then 2
    when 100...150 then 1.5
    when 150...200 then 1
    else 0.5
    end
  end

end

def all_states(data)
  data.each do |state, datum|
    VirusPredictor.new(state, datum[:population_density], datum[:population], datum[:region], datum[:regional_spread]).virus_effects
  end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
all_states(STATE_DATA)

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects