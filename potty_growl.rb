#!/usr/bin/env ruby

require 'rubygems'
require 'mqtt'
require 'growl'

Host = ENV['MQTT_BROKER']
Topic = 'potty/2'

MQTT::Client.connect(Host) do |c|
  c.get(Topic) do |topic,message|
      puts "#{topic}: #{message}"
      if message == "O"
        Growl.notify_ok 'available', :title => 'Potty' 
      elsif message == "X"
        Growl.notify_error 'occupied', :title => 'Potty'
      end
  end
end
