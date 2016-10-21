post '/email' do
  sesh = Goog.new
  sesh.send_email(params)
  redirect '/news'
end

get '/email/new' do
  erb :'goog/new'
end

post '/email/kyle' do
  sesh = Goog.new
  options = params
  options["recipient"] = "kylepdorsey@gmail.com"
  sesh.send_email(options)
  redirect '/news'
end
