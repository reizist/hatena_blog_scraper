module HatenaBlogScraper
  class Article
    attr_reader :url, :title, :body, :html, :markdown
    def initialize(url: nil, title: nil, text: nil, html: nil, markdown: nil)
      @url      = url
      @title    = title
      @text     = text
      @html     = html
      @markdown = markdown
    end
  end
end