module RottenTomatoes
  
  class MovieInfo < API
    
    def initialize(options)
      @movie_id = options[:movie_id]
      super(options.delete_if{ |k,v| [:movie_id].include?(k) })
    end
    
    def define_action
      return "movies/#{@movie_id}"
    end
    
    def get_result
      return parse_response
    end
      
    
  end
  
end
