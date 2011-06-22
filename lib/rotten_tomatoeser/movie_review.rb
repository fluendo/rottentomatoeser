module RottenTomatoes
  
  class MovieReviews < API
    
    def initialize(options)
      super(options.merge!({ :action => :reviews }))
    end
    
    def get_one_review
      
    end
    
    def get_reviews
      
    end
    
  end
  
end
