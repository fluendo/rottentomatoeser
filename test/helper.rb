require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'json'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rottentomatoeser'

def fake_rt_movie_info
  FakeWeb.register_uri(:get, %r|http://api\.rottentomatoes\.com/api/public/v1\.0/movies/.*\.json\?apikey=.*|, :body => PredefinedResponse.movie_info)
end

class PredefinedResponse
  class << self
    def movie_info
     return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n{\"id\":13863,\"title\":\"Pulp Fiction\",\"year\":1994,\"genres\":[\"Drama\"],\"mpaa_rating\":\"R\",\"runtime\":165,\"critics_consensus\":\"One of the most influential films of the 1990s, Pulp Fiction is a delirious post-modern mix of neo-noir thrills, pitch-black humor, and pop-culture touchstones.\",\"release_dates\":{\"theater\":\"1994-09-23\",\"dvd\":\"1998-05-19\"},\"ratings\":{\"critics_rating\":\"Certified Fresh\",\"critics_score\":94,\"audience_rating\":\"Upright\",\"audience_score\":95},\"synopsis\":\"\",\"posters\":{\"thumbnail\":\"http://content9.flixster.com/movie/10/88/65/10886599_mob.jpg\",\"profile\":\"http://content9.flixster.com/movie/10/88/65/10886599_pro.jpg\",\"detailed\":\"http://content9.flixster.com/movie/10/88/65/10886599_det.jpg\",\"original\":\"http://content9.flixster.com/movie/10/88/65/10886599_ori.jpg\"},\"abridged_cast\":[{\"name\":\"John Travolta\",\"characters\":[\"Vincent Vega\"]},{\"name\":\"Samuel L. Jackson\",\"characters\":[\"Jules Winnfield\"]},{\"name\":\"Uma Thurman\",\"characters\":[\"Mia Wallace\"]},{\"name\":\"Harvey Keitel\",\"characters\":[\"The Wolf\"]},{\"name\":\"Bruce Willis\",\"characters\":[\"Butch Coolidge\"]}],\"abridged_directors\":[{\"name\":\"Quentin Tarantino\"}],\"alternate_ids\":{\"imdb\":\"0110912\"},\"links\":{\"self\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/13863.json\",\"alternate\":\"http://www.rottentomatoes.com/m/pulp_fiction/\",\"cast\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/13863/cast.json\",\"reviews\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/13863/reviews.json\",\"similar\":\"http://api.rottentomatoes.com/api/public/v1.0/movies/13863/similar.json\"}}\n"  
    end
  end
end
