module Okpublished
  class Base
    
    attr_accessor :config
    
    def initialize(config)
      @config = config
    end

    def url_to_file(url)
      File.open("/tmp/image.jpg", "wb") do |f|
        f.write Net::HTTP.get_response(URI.parse(url)).body
      end
    end

  end
end