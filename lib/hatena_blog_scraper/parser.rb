require "nokogiri"
require "open-uri"

module HatenaBlogScraper
  class Parser
    DEFAULT_PER_PAGE = 30 # hatenablogの /archive に表示されるMAX記事数
    
    def initialize(base_url: nil)
      @base_url = base_url
    end
    
    def get_articles(count: 1)
      has_next      = nil
      articles      = []
      current_count = 0
      current_page  = 1
      
      catch(:done) do
        begin
          urls = list_article_urls(page: current_page)
          has_next = urls.count == DEFAULT_PER_PAGE
          urls.each do |url|
            articles << get_article(article_url: url)
            current_count += 1
            throw(:done) if current_count >= count
          end
          current_page += 1
        end while has_next
      end
      
      articles
    end
    
    def get_article(article_url: nil)
      html  = open(article_url).read
      doc   = Nokogiri::HTML.parse(html, nil, 'utf-8')
      text  = doc.xpath('//div[@class="entry-content"]').text
      html  = doc.xpath('//div[@class="entry-content"]').to_html
      title = doc.xpath('//h1[@class="entry-title"]').text.strip
      
      Article.new(url: article_url, title: title, text: text)
    end
    
    def list_article_urls(page: 1)
      html = open(archive_url(page: page)).read
      doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
      urls = doc.xpath('//a[@class="entry-title-link"]').map do |link|
        link.attribute("href").value
      end
      urls
    end
    
    private
    
    def archive_url(page: 1)
      "#{@base_url}/archive?page=#{page}"
    end
  end
end