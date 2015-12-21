#!/usr/bin/env ruby
require './app/resource.rb'

class Facility
  attr_reader :level
  attr_reader :res_reserve

  def initialize(**res_types)
    @level = 1
    @res_maint = res_types[:maint]
    @res_energy = res_types[:energy]
    @res_output = res_types[:output]
    @res_reserve = 0
    set_production_base_rate
    set_production_current_level_rate
  end

  ##  EXPLOITING-RELATED METHODS
  # exploit_resources recieves input units of a given energetic resource
  # and stores them in input_buffer to progressively consume them
  # at a rate 1 unit per minute
  #
  # Each cosumed item generates @p_base_rate exploited resource units
  #
  def exploit_resource(resource)
    input_buffer = resource.value
    output_buffer = 0
    t = calculate_exploiting_time(resource)
    t.times do
      # Consume 1 energy resource unit 
      input_buffer -= 1
      # Each consuming step should last 1 minute but 
      # for developing purposes sleep time is lowered to 0.1 minutes
      # sleep 60 
      #
      resource.consume(1)
      sleep 0.1
      # Generate the regular resource unit at a @p_base_rate rate
      # and store it at output_buffer
      #
      output_buffer += @current_p_rate
      puts "Producing #{output_buffer} units"
    end
    # Return what have been stored in ouput_buffer
    Resource.new(@res_output, output_buffer)
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
  def calculate_exploiting_time(resource)
    # Suppose 1 input energy-unit unit gives 1 energy-minute
    resource.value * resource.energy_rate
  end

  ## UPGRADE-RELATED METHODS
  def add_reserve(resource_investment)
     @res_reserve += resource_investment
  end

  def upgrade(resource)
    if enough?(resource)
      pay_upgrade_cost(resource)
      add_reserve(upgrade_level_cost)
      @level += 1
      set_production_current_level_rate
    end
  end

  def pay_upgrade_cost(resource)
    resource.value -= upgrade_level_cost
  end

  def enough?(resource)
    resource.type == @res_maint && resource.value >= upgrade_level_cost
  end

  def upgrade_level_cost
    Utilities.fibonacci(@level + 1) * 10
  end

  def set_production_current_level_rate
    @current_p_rate = @p_base_rate + calculate_production_rate_increment(@level)
  end

  def calculate_production_rate_increment(level)
    Math.log2(level).round
  end

  def downgrade(resource)
    if @level > 1
      @level -= 1
      r = return_upgrade_cost(resource)
      set_production_current_level_rate
      return r
    end
  end

  def return_upgrade_cost(resource)
    @res_reserve -= upgrade_level_cost
    resource.value += upgrade_level_cost
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
end

class Treasury

  # Initialize treasury with default resources
  def initialize
    create_default_resources
  end

  # Add resource to the treasury
  def add(resource)
    get_resource(resource.type).value += resource.value
  end

  # Get resource from the treasury
  def get(resource_type, resource_value)
    # Check if resource if available from treasury
    if available?(resource_type, resource_value)
      # Resource is taken from treasury
      get_resource(resource_type).value -= resource_value

      # Return asked resource
      Resource.new(resource_type, resource_value)
    else
      nil
    end
  end

  # Check if resource is available in treasury
  def available?(resource_type, resource_value)
    get_resource(resource_type).value  - resource_value >= 0
  end

  # Print in-treasury stored resources
  def get_state
    "Treasury state: #{@resources}"
  end 

  private
  # Set default treasury resources
  def create_default_resources
     resources = [:timber, :iron, :gold, :copper, :diamond, :clay, :marble,
                  :coal, :oil, :gas, :water, :uranium]
     @resources = []
     resources.each do |r|
       @resources << Resource.new(r, 1000)
     end
  end

  # Get a resource from @treasury given resource_type
  def get_resource(resource_type)
    (@resources.select{|r| r.type == resource_type}).first
  end
end

class Spot
end

class Utilities
  def self.fibonacci(n)
    n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 )
  end
end
