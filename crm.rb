require_relative 'contact'
require 'sinatra'

get '/' do
  @contacts_page = "/contacts"
  @contacts = Contact.all
  erb :index
end

get '/contacts' do
  @landing_page = "/"
  @all_contacts = Contact.all
  erb :contacts
end


after do
  ActiveRecord::Base.connection.close
end
