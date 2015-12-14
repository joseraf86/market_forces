#!/usr/bin/env ruby
require './core_structures.rb'
require 'thread'

semaphore = Mutex.new
treasury = Treasury.new

facilities = []	
5.times do 
  facilities << Facility.new(output: :gold, energy: :coal, maint: :timber)
end

workers = []
  facilities.each do |w|
    workers << Thread.new(treasury) do |t|
      gotten = nil 
      semaphore.synchronize{gotten = t.get(coal: 100)}
      exploited_resource = w.exploit_resource(gotten)
      semaphore.synchronize{t.add(exploited_resource)}
    end
end
workers.each(&:join)

puts treasury.get_state
