get '/user/new' do


erb :'/user/new'
end

post '/user/new' do
 user = User.new(params[:user])
 if user.save
   redirect '/user/:id'
 else
   @errors = user.errors.full_messages
    erb :'/user/new'
 end
end


get '/user/:id' do
  @user = User.find(:id)
  erb :profile
end
