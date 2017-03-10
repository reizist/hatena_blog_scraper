# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hatena_blog_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "hatena_blog_scraper"
  spec.version       = HatenaBlogScraper::VERSION
  spec.authors       = ["reizist"]
  spec.email         = ["reizist@gmail.com"]

  spec.summary       = "A client library for getting articles of HatenaBlog in Ruby."
  spec.description   = ""
  spec.homepage      = "https://github.com/reizist/hatena_blog_scraper"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", '~> 0'
  spec.add_dependency "slop", "~> 4.0"
  spec.add_dependency "reverse_markdown", "~> 1.0"
  
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
