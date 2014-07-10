require 'rubygems'
require 'rest_client'
require 'json'

require File.expand_path('../kairos/client', __FILE__)

module Kairos
  
  def self.get_client(opts={})
    Kairos::Client::Base.new(opts)
  end
  
end
