get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  if @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password])
       session[:user_id] = @user.id
       erb  :"/users/profile"
     else
     @errors = ["Invalid password!"]
     @decks = Deck.all
     erb :index
    end
  else
    @errors = ["User not found!"]
    @decks = Deck.all
    erb :index
  end
end
