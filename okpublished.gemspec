$:.unshift File.expand_path('../lib', __FILE__)
require 'okpublished/version'

Gem::Specification.new do |gem| 
  gem.name = 'okpublished' 
  gem.version =  Okpublished::VERSION
  gem.date = '2014-04-16' 
  gem.summary = "Share post" 
  gem.license = 'MIT'
  gem.description = "Share posts in facebook, twitter and google+ easy mode" 
  gem.authors = ["Angel Botto", 'Michel Perez'] 
  gem.email = ['angel.botto@gmail.com', 'michel.ingesoft@gmail.com'] 
  gem.homepage = 'http://kreattiewe.com/okpublished' 

  gem.files = Dir['lib/**/*']
  gem.require_paths = ["lib"]

  gem.add_dependency 'koala', "~> 1.9"
  gem.add_dependency 'twitter', "~> 5.8"
 
end