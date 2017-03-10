はてなブログの記事内容を取得するGem.

# Usage

```ruby
require "hatena_blog_scraper"
HatenaBlogScraper.new(url: "http://reizist.hatenablog.com").list_articles(count: 2)

=> [
  [#<HatenaBlogScraper::Article:0x007fe28d374c00
    @url='',
    @title='',
    @html='',
    @text='',
    @markdown=''>, ...
]

```


also see: [はてなブログのガイドライン](http://help.hatenablog.com/entry/guideline#prohibition)

