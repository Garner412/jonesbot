get '/tweets' do
  testing = Twootter.new
  @tweets = testing.search
  @tweets.each do |tweet|
    p tweet.full_text
    p tweet.uri
  end
  erb :'tweets/index'
end


# https://api.twitter.com/1.1/search/tweets.json
