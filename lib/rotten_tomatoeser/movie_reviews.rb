module RottenTomatoes
  
  class MovieReviews < API
    
    def initialize(options)
      super(options.delete_if{ |k,v| [:movie_id].include?(k) })
    end
       
    def get_results
      
    end
    
  end
  
end
