get '/news' do
  resp = Newsapi.get_sources
  @sources = resp["sources"]
  erb :'news/index'
end

get '/news/:sourcename' do
  @resp = Newsapi.search(params[:sourcename])
  pp @resp
  erb :'news/show'
end

