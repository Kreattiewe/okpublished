module Okpublished
  class Base
    
    attr_accessor :publicate
    
    def initialize(config)
      @config = config
    end

    def publicate_facebook(text, image)
      
      url_to_file(image)
      graph = Koala::Facebook::API.new(@config[:facebook][:access_token])
      page_token = graph.get_page_access_token(@config[:facebook][:page_id])

      @page = Koala::Facebook::API.new(page_token)
      @page.put_picture(File.new("/tmp/image.jpg"), { :message => text})
    end

    def publicate_twitter(text, image)
      url_to_file(image)
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = @config[:twitter][:consumer_key]
        config.consumer_secret     = @config[:twitter][:consumer_secret]
        config.access_token        = @config[:twitter][:access_token]
        config.access_token_secret = @config[:twitter][:access_token_secret]
      end

      @client.update_with_media("#{text}", File.new("/tmp/image.jpg"))
    end
    
    def url_to_file(url)
      File.open("/tmp/image.jpg", "wb") do |f|
        f.write Net::HTTP.get_response(URI.parse(url)).body
      end
    end

    def validate_facebook?
      @config.include?(:facebook)
    end

    def validate_twitter?
      @config.include?(:twitter)
    end


    def publicate(text, image,debug=false)
      if debug
        puts "#{text} - #{image}"
      end

      if validate_facebook?
        publicate_facebook(text, image)
      end

      if validate_twitter?
        publicate_twitter(text, image)
      end
    end


  end
end