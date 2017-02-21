require 'mailgun'
class HomeController < ApplicationController
  def index
  end
  def write

    post = Post.new
    post.name = params[:name]
    post.email = params[:email]
    post.message = params[:message]

    mg_client = Mailgun::Client.new("key-a61ca9d4c080eae610c5b83771d3fdbc")

    message_params =  {
                   from: @name,
                   to:   'cuk@likelion.org',
                   subject: @email,
                   text:    @message
                  }

                  result = mg_client.send_message('sandboxe8e7ec6c028347bfa368642d55dfabec.mailgun.org', message_params).to_h!

                  message_id = result['id']
                  message = result['message']
    if post.save
    redirect_to '/'


  end
end
