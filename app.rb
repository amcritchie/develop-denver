require 'sinatra/base'
require 'sinatra/activerecord'
require 'action_view'
require 'date'
require 'active_support'

# include all .rb files in models directory
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }

class App < Sinatra::Application

  #initial application settings
  set :root, File.dirname(__FILE__)
  register Sinatra::ActiveRecordExtension
  include ActionView::Helpers::DateHelper

  get "/" do
    messages = Message.order(updated_at: :desc)
    erb :index, locals: {messages: messages}
  end

  get "/messages" do

  end

  get "/messages/:id" do
    message = Message.find(params[:id])
    erb :message, locals: {message: message}
  end

  get "/messages/new" do

  end

  post "/messages" do
    Message.create(
      message: params[:message],
      name: params[:name]
    )
    redirect "/"
  end


  patch "/messages/:id" do
  message = Message.find(params[:id])
  message.update(message: params[:message])
  redirect "/"
  end


  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    redirect "/"
  end
end
