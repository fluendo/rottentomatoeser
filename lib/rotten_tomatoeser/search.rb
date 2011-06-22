module RottenTomatoes
  
  class Search < API
    
    def initialize(options)
      super(options)
    end
    
    def define_action
      return "movies"
    end
    
    def get_results
      return parse_response['movies']
    end
    
    def get_first_result
      if res=get_all_results
        return res.first
      else
        return nil
      end
    end
    
    
  end
  
end
