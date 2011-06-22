require 'helper'

class TestRtMovieInfo < Test::Unit::TestCase
  
  context "API" do
  
    setup do
      fake_rt_movie_info
    end

    should "get result for a movie" do
      assert ::RottenTomatoes::MovieInfo.new(:api_key => 123456, :movie_id => 12345).get_result['title'] == 'Pulp Fiction'
    end
  
  end
  
end

