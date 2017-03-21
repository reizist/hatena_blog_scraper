require "reverse_markdown"

module HatenaBlogScraper
  class Article
    attr_reader :url, :title, :text, :html, :markdown
    def initialize(url: nil, title: nil, text: nil, html: nil)
      @url      = url
      @title    = title
      @text     = text
      @html     = html
      @markdown = ReverseMarkdown.convert(html)
    end
  end
end