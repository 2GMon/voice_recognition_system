#! /usr/bin/env ruby

require 'webrick'

(document_root, port) = ARGV

server = WEBrick::HTTPServer.new({
    :DocumentRoot => document_root,
    :BindAddress => '0.0.0.0',
    :Port => port
})

['INT', 'TERM'].each do |signal|
    Signal.trap(signal){ server.shutdown }
end

server.start
