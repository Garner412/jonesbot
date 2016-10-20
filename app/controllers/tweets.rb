post '/tweets' do
  twtr = Twootter.new
  @tweets = twtr.search(params[:twitterhandle],20)
  erb :'tweets/index'
end


# https://api.twitter.com/1.1/search/tweets.json
get '/nearby' do
  twtr = Twootter.new
  @tweets = twtr.nearby([41.876471,-87.653172,"1mi"], 20)
  @tweets.each do |tweet|
    p tweet.place.to_hash
  end
  erb :'tweets/index'
end
