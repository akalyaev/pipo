#!/usr/bin/ruby
require 'socket'
puts "Starting up server..."
# establish the server
server = TCPServer.new(2008)
# setup to listen and accept connections
loop do
  Thread.start(server.accept) do |client|
    puts "log: Connection from #{client.peeraddr[2]} at #{client.peeraddr[3]}"
    while input = client.gets
      puts input
      if input.include?('ping')
        client.puts("pong\r\n")
      end
    end
  end  #end thread conversation
end   #end loop