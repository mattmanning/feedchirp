class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_uid(auth['uid'])
    user = User.create_with_omniauth(auth) unless user
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!'
  end
end
