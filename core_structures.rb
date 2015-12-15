#!/usr/bin/env ruby

class Facility

  attr_reader :level

  def initialize(**res_types)
  	@level = 1
    @res_maint = res_types[:maint]
    @res_energy = res_types[:energy]
    @res_output = res_types[:output]
    @res_reserve = 0
    set_production_base_rate
  end

  def add_reserve
     @res_reserve
  end

  def upgrade(resource)
    if enough?(resource)
      @level += 1
    end
  end

  def enough?(resource)
    puts get_key(resource)
    puts get_value(resource)
    puts @res_maint
    puts next_level?
    puts 'XXXXXXX'
    get_key(resource) == @res_maint && get_value(resource) == next_level?
  end

  def next_level?
    Utilities.fibonacci(@level + 1) * 10
  end

  def downgrade
    @level -= 1 unless @level <= 1
  end

  # exploit _resources recieves input units of a given energetic resource
  # and stores them in input_buffer to progressively consume them
  # at a rate 1 unit per minute
  #
  # Each cosumed item generates @p_base_rate exploited resource units
  #
  def exploit_resource(input)
  	input_buffer = input.values.first
  	output_buffer = 0
  	t = calculate_exploiting_time(input)
  	t.times do
  	  # Consume 1 energy resource unit 
  	  input_buffer -= 1
  	  # Each consuming step should last 1 minute but 
  	  # for developing purposes sleep time is lowered to 0.1 minutes
  	  # sleep 60 
  	  #
  	  sleep 0.1
      # Generate the regular resource unit at a @p_base_rate rate
      # and store it at output_buffer
      #
  	  output_buffer += @p_base_rate
  	  puts "Producing #{output_buffer} units"
    end
    # Return what have been stored in ouput_buffer
    {@res_output => output_buffer}
  end

  # calculate_exploiting_time calculates how many
  # energy-minutes are given by input energetic resource units 
  #
  # energy-minutes is an in-game energy measure
  # that relates energetic resources with facilities working uptime
  #
  # energy-minutes are simply the amount of minutes a facility
  # can operate if given certain amount of energetic resource
  #
  # Example:
  # Given 5 oil units and a rate of 
  # 10 ener-minute per energetic resource
  # 5 oil * 10 e-min/oil = 50 e-min
  # 50 minutes of facility working uptim
  # 
  def calculate_exploiting_time(input)
  	# Suppose 1 input energy-unit unit gives 1 energy-minute
    input.values.first*Resource.energy_rate(input.keys.first) 
  end

  def energy_rates(e_resource)
    case e_resource
    when :coal
      1
    end   
  end

  def set_production_base_rate 
  	case @res_output
    when :timber
    	@p_base_rate = 1
    when :iron
      @p_base_rate = 1
    when :gold
      @p_base_rate = 1
    when :copper
      @p_base_rate = 1
    when :diamond
      @p_base_rate = 1
    when :clay
      @p_base_rate = 1
    when :marble
      @p_base_rate = 1
    when :coal
      @p_base_rate = 1
    when :oil
      @p_base_rate = 1
    when :gas
      @p_base_rate = 1
    when :water
      @p_base_rate = 1
    when :uranium
      @p_base_rate = 1
    end
  end

  def get_key(**hash)
    hash.keys.first
  end

  def get_value(**hash)
    hash.values.first
  end
end

class Treasury
  def initialize
  	@resources = {timber: 0,
                  iron: 0,
                  gold: 0,
                  copper: 0,
                  diamond: 0,
                  clay: 0,
                  marble: 0,
                  coal: 1000,
                  oil: 0, 
                  gas: 0, 
                  water: 0, 
                  uranium: 0}
  end

  def add(**income)
  	@resources[get_key(income)] += get_value(income)
  end

  def get_key(**hash)
    hash.keys.first
  end

  def get_value(**hash)
    hash.values.first
  end

  def get(**outcome)
  	if available?(outcome)
      key = get_key(outcome)
      value = get_value(outcome)
  	  @resources[key] -= value
      {key => value}
  	else
  	  nil
  	end
  end

  def available?(**resource)
    @resources[get_key(resource)] - get_value(resource) >= 0
  end
 
  def get_state
  	"Treasury state: #{@resources}"
  end	
end

class Spot
end

class Resource
  attr_accessor :type, :quantity

  def self.energy_rate(resource)
    case resource
    when :coal
      1
    when :oil
      1
    when :gas
      1
    when :water
      1
    when :uranium
      1
    end
  end
end

class Utilities
  def self.fibonacci(n)
    n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 )
  end
end
