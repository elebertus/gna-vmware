#!/home/eblack/.rvm/rubies/ruby-1.9.2-p180/bin/ruby
require 'savon/client'
client = Savon::Client.new do
  wsdl.document = "https://phxvc.domestic.guitarcenter.com/sdk/vim.wsdl"
end
client.wsdl.soap_actions
