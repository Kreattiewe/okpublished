require 'koala'
require './okpublished/base'

module Okpublished
  class Facebook <  Okpublished::Base

    attr_accessor :publicate

    graph = Koala::Facebook::GraphAPI.new(@config[:facebook][:access_token])
    page_token = graph.get_page_access_token(@config[:facebook][:page_id])

    $page = Koala::Facebook::API.new(page_token)
      
    #Publicar post
    def publicate(text, image)
      url_to_file(image)
      $page.put_picture(File.new("/tmp/image.jpg"), { :message => text})
    end
    
  end
end
