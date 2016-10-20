get '/news' do
  @resp = HTTParty.get("https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=#{ENV['NEWS_KEY']}", "Accept" => "application/json")
  erb :'news/index'
  # p @resp.to_json
end