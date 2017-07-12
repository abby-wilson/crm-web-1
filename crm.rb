require_relative 'contact'
require 'sinatra'

get '/' do
  @contacts_page = "://localhost:4567/contacts"
  erb :index
end

get '/contacts' do
  @landing_page = "://localhost:4567/"
  @all_contacts = Contact.all
  erb :contacts
end


after do
  ActiveRecord::Base.connection.close
end
