#!/usr/bin/env ruby
require './core_structures.rb'

def production_simulation(treasury)
  facilities = []	
  2.times do 
    facilities << Facility.new(maint: :timber, output: :gold, energy: :coal)
  end

  workers = []
  facilities.each do |w|
  	workers << Thread.new(treasury){|t| t.add(w.exploit_resource(t.get(10)))}
  end
  workers.each(&:join)
end

t = Treasury.new
production_simulation(t)

puts t.get_state
