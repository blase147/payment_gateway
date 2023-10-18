# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
    def new
      # This action will render the payment form
    end
  
    def create
      # Handle the payment request using the provided code
      require 'uri'
      require 'net/http'
      require 'openssl'
  
      url = URI("https://test.payu.in/_payment")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
  
      request = Net::HTTP::Post.new(url)
      request["Accept"] = 'application/json'
      request["Content-Type"] = 'application/x-www-form-urlencoded'
  
      request.body = "key=JP***g&txnid=txnid62351480640&amount=10.00&firstname=Ashish&email=test@gmail.com&phone=9876543210&productinfo=iPhone&pg=TESTPG&bankcode=TESTPGNB&surl=https://test-payment-middleware.payu.in/simulatorResponse&furl=https://test-payment-middleware.payu.in/simulatorResponse&ccnum=&ccexpmon=&ccexpyr=&ccvv=&ccname=&txn_s2s_flow=4&hash=e48c5dd4fcde2afebbeac4e34347382d11c93191b8e86b6830102b81f7679b3aa020e472f2b8209d580df5ac0936f96f212e19943b7137a579acf51795dc350e"
      
      response = http.request(request)
  
      # Process the response here (redirect, show response to the user, etc.)
    end
  end
  