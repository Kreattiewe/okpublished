require './okpublished/base'
require './okpublished/facebook'

config = {
  :facebook => {
    :access_token => "a",
    :page_id => "b"
  },
  :twitter => {
    :consumer_key => "a",
    :consumer_secret => "a",
    :access_token => "a",
    :access_secret => "a"
  }
}

#Initialize all data
Okpublished::Base.new(config)

@data = Okpublished::Facebook.new
@data.publicate("anda","anda")