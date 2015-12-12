#!/usr/bin/env ruby
class Facility

  def initialize(**res_types)
  	@level = 1
    @res_maint = res_types[:maint]
    @res_energy = res_types[:energy]
    @res_output = res_types[:output]
    set_production_base_rate
  end

  # treasury: Spot's treasury
  # input: amout of energy needed
  # 1 Energy is equivalent to 1 minute facility uptime
  #
  # Given 5 energetic resource units and a rate of 
  # 10 minutes facility uptime per energetic resource
  # 5 oil * 10 min/oil = 50 min of production time
  #  
  def exploit_resource(input)
  	input_buffer = input
  	output_buffer = 0
  	t = calculate_exploiting_time(input)
  	t.times do
  	  # Consume 1 energy resource unit 
  	  input_buffer -= 1
  	  # Each step extracting step should last 1 minute but 
  	  # for developing purposes sleep time is lowered to 0.1 minutes
  	  # sleep 60 
  	  #
  	  # Extract the resource
  	  sleep 0.1
  	  output_buffer += @p_base_rate
  	  puts "Producing #{output_buffer} units"
    end
    output_buffer
  end

  def calculate_exploiting_time(input)
  	# Suppose 1 input gives 1 energy minute
  	input*1
  end

  def set_production_base_rate 
  	case @res_output 
    when :gold
    	@p_base_rate = 1
    end
  end
end

class Treasury
  
  def initialize
  	@resource = 0
  	@energy = 150
  end

  def add(income)
  	@resource += income
  end

  def get(outcome)
  	if @energy - outcome >= 0 
  	  @energy -= outcome
  	else
  	  0
  	end
  end	
 

  def get_state
  	"Treasury state: gold: #{@resource}, energy #{@energy}"
  end	
end


class Spot
end
