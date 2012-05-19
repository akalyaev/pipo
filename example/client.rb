#!/usr/bin/ruby
require 'socket'
# establish connection
clientSession = TCPSocket.new("localhost", 2008)
puts "log: starting connection"

clientSession.puts("ping\r\n")

# wait for messages from the server
while !(clientSession.closed?) &&
    (serverMessage = clientSession.gets)
  puts serverMessage
  if serverMessage.include?('pong')
    sleep(10)
    clientSession.puts("ping\r\n")
  end
end #end loop