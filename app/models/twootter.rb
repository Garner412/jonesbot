class Twootter

  attr_accessor :client

  def initialize()
    #  Twitter::Streaming::Client.new do |config|
    self.client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end

  def search(username)
    client.user_timeline(username)
  end

end
