#!/usr/bin/env ruby
require File.expand_path("../resource", __FILE__)
require File.expand_path("../utilities", __FILE__)

class Facility
  attr_reader :level
  attr_reader :res_reserve

  def initialize(**res_types)
    @level = 1
    @res_maint_type = res_types[:maint]
    @res_energy_type = res_types[:energy]
    @res_output_type = res_types[:output]
    @res_reserve = Resource.new(@res_maint_type, 0)
    set_production_base_rate
    set_production_current_level_rate
  end

  ##  EXPLOITING-RELATED METHODS ##

  # exploit_resources recieves input units of a given energetic resource
  # and stores them in input_buffer to progressively consume them
  # at a rate 1 unit per minute
  #
  # Each cosumed item generates @production_base_rate exploited resource units
  #
  def exploit_resource(resource)
    # resource must be the same energetic type set to the facility
    if resource.type == @res_energy_type
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
        # Generate the regular resource unit at a @production_base_rate rate
        # and store it at output_buffer
        #
        output_buffer += @current_production_rate
        puts "Producing #{output_buffer} units"
      end
      # Return what have been stored in ouput_buffer
      Resource.new(@res_output_type, output_buffer)
    end
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
    resource.value * resource.energy_rate
  end

  ## UPGRADE-RELATED METHODS ##

  # Increase facility level and its production rate
  def increase_level
    @level += 1
    set_production_current_level_rate
  end

  # Set new production rate depending current facility level
  def set_production_current_level_rate
    @current_production_rate = @production_base_rate + calculate_production_rate_increment(@level)
  end

  # Upgrade facility level it's enough resources are invested
  def upgrade(resource)
    if enough?(resource)
      pay_upgrade_cost(resource)
      increase_level
    end
  end

  # Check if there's enough resources
  def enough?(resource)
    resource.type == @res_maint_type && resource.value >= upgrade_level_cost
  end

  # Consume the resource invested and store that amount in @res_reserve resource
  def pay_upgrade_cost(resource)
    resource.consume(upgrade_level_cost)
    @res_reserve.add(upgrade_level_cost)
  end

  def upgrade_level_cost
    Utilities.fibonacci(@level + 1) * 10
  end

  def calculate_production_rate_increment(level)
    Math.log2(level).round
  end

  ## DOWNGRADE-RELATED METHODS ##

  # Decrease facility level and its production rate
  def decrease_level
    @level -= 1
    set_production_current_level_rate
  end

  # Downgrade facility level it's enough resources are invested
  def downgrade
    if @level > 1
      decrease_level
      return_upgrade_cost
    end
  end

  # Get the resource stored in @res_reserve and return this amount back in a new resource
  def return_upgrade_cost
    @res_reserve.consume(upgrade_level_cost)
    Resource.new(@res_reserve.type, upgrade_level_cost)
  end

  # Set production rate base levels when a facility is instantiated
  def set_production_base_rate 
    case @res_output_type
    when :timber
      @production_base_rate = 1
    when :iron
      @production_base_rate = 1
    when :gold
      @production_base_rate = 1
    when :copper
      @production_base_rate = 1
    when :diamond
      @production_base_rate = 1
    when :clay
      @production_base_rate = 1
    when :marble
      @production_base_rate = 1
    when :coal
      @production_base_rate = 1
    when :oil
      @production_base_rate = 1
    when :gas
      @production_base_rate = 1
    when :water
      @production_base_rate = 1
    when :uranium
      @production_base_rate = 1
    end
  end
end
