#!/usr/bin/env ruby
module Utilities
  def Utilities.fibonacci(n)
    n <= 1 ? n : fibonacci( n - 1 ) + fibonacci( n - 2 )
  end
end
