class WelcomeController < ApplicationController
  require 'embedly'
  require 'json'
 
  def index
 
    embedly_api =
      Embedly::API.new :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
 
    obj = embedly_api.oembed :url => 'http://www.youtube.com/watch?v=Li86xtWoVwU'
    json_sting = JSON.pretty_generate(obj[0].marshal_dump)
    @json_obj = ActiveSupport::JSON.decode(json_obj)
  end
 
  def about
  end
end
