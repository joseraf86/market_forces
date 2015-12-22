#!/usr/bin/env ruby
require File.expand_path("../../app/facility", __FILE__)
require File.expand_path("../../app/treasury", __FILE__)

f = Facility.new(output: :gold, energy: :coal, maint: :timber)
r = Resource.new(:timber, 1000000)
t = Treasury.new

f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
f.upgrade(r)
p t
p t
p f
#resource = t.get(coal: 100)
#e_resource = Resource.new(resource.keys.first, resource.values.first)
#  f.exploit_resource(e_resource)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
f.downgrade(r)
p f
p t
