class Newsapi

  def self.search(source_name)
    HTTParty.get("https://newsapi.org/v1/articles?source=#{source_name}&sortBy=top&apiKey=#{ENV['NEWS_KEY']}", "Accept" => "application/json")
  end

  def self.get_sources()
    HTTParty.get("https://newsapi.org/v1/sources?language=en", "Accept" => "application/json")
  end

end
