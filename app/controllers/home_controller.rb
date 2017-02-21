require 'mailgun'
class HomeController < ApplicationController
  def index
  end
  def write

    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    mg_client = Mailgun::Client.new("key-a61ca9d4c080eae610c5b83771d3fdbc")

    message_params =  {
                   from: @email,
                   to:   'cuk@likelion.org',
                   subject: @name,
                   text:    @message
                  }

                  result = mg_client.send_message('sandboxe8e7ec6c028347bfa368642d55dfabec.mailgun.org', message_params).to_h!

                  message_id = result['id']
                  message = result['message']


    redirect_to '/'
  end
end
