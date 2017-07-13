require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
  erb :index
end

get '/contacts' do
  @landing_page = "/"
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # contacts_id = params[:id]
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
