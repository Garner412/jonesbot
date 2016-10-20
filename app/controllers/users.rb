get '/users/new' do
  if request.xhr?
    erb :'users/_new' , layout: false
  end
end

post '/users' do
  user = User.new(username: params[:username], email: params[:email])
  user.password = params[:password]
  if user.save?
    redirect '/'
  else
    erb :'users/_errors', layout: false
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if owner?(@user)
    erb :'users/show'
  else
    redirect '/'
  end
end

get '/sessions/new' do
  if request.xhr?
    erb :'users/_login' , layout: false
  end
end

post '/sessions' do
  authenticated_user = User.authenticate(params[:username],params[:password])
  if authenticated_user
    session[:user_id] = authenticated_user.id
    redirect '/'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end