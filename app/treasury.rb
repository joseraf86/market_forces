#!/usr/bin/env ruby
require File.expand_path("../resource", __FILE__)

class Treasury
  # Initialize treasury with default resources
  def initialize
    create_default_resources
  end

  # Add resource to the treasury
  def add(resource)
    get_resource(resource.type).add(resource.value)
  end

  # Get resource from the treasury
  def get(resource_type, resource_value)
    # Check if resource if available from treasury
    if available?(resource_type, resource_value)
      # Resource is taken from treasury
      get_resource(resource_type).consume(resource_value)

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
