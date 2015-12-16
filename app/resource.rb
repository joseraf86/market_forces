#!/usr/bin/env ruby

class Resource
  attr_accessor :type, :value
  ENERGY_RATES = {coal: 1, oil: 1, gas: 1, water: 1, uranium: 1}

  def initialize(type, value)
    @type = type
    @value = value
  end

  def consume(value)
    @value -= value
  end

  def energy_rate
    case @type
    when :coal
      ENERGY_RATES[:coal]
    when :oil
      ENERGY_RATES[:oil]
    when :gas
      ENERGY_RATES[:gas]
    when :water
      ENERGY_RATES[:water]
    when :uranium
      ENERGY_RATES[:uranium]
    end   
  end

  def self.energy_rate(resource_type)
    case resource_type
    when :coal
      ENERGY_RATES[:coal]
    when :oil
      ENERGY_RATES[:oil]
    when :gas
      ENERGY_RATES[:gas]
    when :water
      ENERGY_RATES[:water]
    when :uranium
      ENERGY_RATES[:uranium]
    end  
  end
end
