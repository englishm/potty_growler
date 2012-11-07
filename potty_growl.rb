#!/usr/bin/env ruby

require 'rubygems'
require 'mqtt'
require 'terminal-notifier'

Host = ENV['MQTT_BROKER']
Topic = 'potty/2'

MQTT::Client.connect(Host) do |c|
  c.get(Topic) do |topic,message|
      puts "#{topic}: #{message}"
      if message == "O"
        TerminalNotifier.notify('available', :title => 'Potty', :subtitle => 'AOHQ Upstairs')
      elsif message == "X"
        TerminalNotifier.notify('occupied', :title => 'Potty', :subtitle => 'AOHQ Upstairs')
      end
  end
end
