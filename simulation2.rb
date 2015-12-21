#!/usr/bin/env ruby
require './app/core_structures.rb'

f = Facility.new(output: :gold, energy: :coal, maint: :timber)
r = Resource.new(:timber, 100)
t = Treasury.new

f.upgrade(r)
#f.upgrade(r)
p t
p f
resource = t.get(:coal, 100)
e_resource = Resource.new(resource.type, resource.values)
f.exploit_resource(e_resource)
f.downgrade(r)
#f.downgrade(r)
p f
p t