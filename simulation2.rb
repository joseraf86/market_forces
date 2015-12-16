#!/usr/bin/env ruby
require './app/core_structures.rb'

f = Facility.new(output: :gold, energy: :coal, maint: :timber)
r = Resource.new(:timber, 100)
f.upgrade(r)
f.upgrade(r)
f
e_resource = Resource.new(:coal, 100)
f.exploit_resource(e_resource)
f.downgrade(r)
f.downgrade(r)
f