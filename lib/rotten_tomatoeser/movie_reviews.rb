module RottenTomatoes
  
  class MovieReviews < API
    
    def initialize(options)
      @movie_id = options[:movie_id]
      super(options.delete_if{ |k,v| [:movie_id].include?(k) })
    end
    
    def define_action
      return "movies/#{@movie_id}/reviews"
    end
       
    def get_results
      return parse_response['reviews']
    end
    
  end
  
end
