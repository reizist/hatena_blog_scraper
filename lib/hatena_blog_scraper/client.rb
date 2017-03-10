require 'open-uri'

module HatenaBlogScraper
  class Client
    def initialize(url: nil)
      @url = url
      @host = host
    end
  
    def get
      url = URI.encode(@url)
      open(url).read
    end
    
    def list_articles(count: 1)
      Parser.new(base_url: @url).get_articles(count: count)
    end
    
    private
    
    def host
      URI.parse(@url).host
    end
  end
end