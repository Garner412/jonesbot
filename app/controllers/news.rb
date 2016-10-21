get '/news' do
  resp = Newsapi.get_sources
  @sources = resp["sources"]
  pp @sources
  erb :'news/index'
end

get '/news/:sourcename' do
  @resp = Newsapi.search(params[:sourcename])
  if @resp["status"] != "error"
    erb :'news/show'
  else
    redirect "/news"
  end
end

