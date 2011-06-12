#!/home/eblack/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

require 'savon/client'

endpoints = {
    :wsdl => "https://host/sdk/vim.wsdl",
    :endpoint => "https://host/sdk/vimService"
}
client = Savon::Client.new do
  wsdl.document = "https://host/sdk/vim.wsdl"
  wsdl.endpoint = "https://host/sdk/vimService"
  http.auth.ssl.cert_file = 'host.cert'
  http.auth.ssl.verify_mode = :none
end
#  WSSE auth doesn't appear to work..
#  But if it did the following would be appropriate
#  client.wsse.credentials "username", "strongpass"
request = client.request(:urn, 'QueryDateTime' ) { 
  soap.body = {
    "_this type='dateTime'" => "dateTime"
}
}

puts request.to_xml

