module RottenTomatoes

  require 'uri'
  
  class API
    
    #attr_reader :api_key, :base_url, :movie_id, :action
    
    def initialize(options)
      @api_key = options[:api_key] || "j27vqb4dbx7g9bn4g4pp8vgu"
      @base_url = options[:base_url] || "http://api.rottentomatoes.com/api/public/v1.0"
      @params = options.delete_if{ |k,v| [:api_key, :base_url].include?(k) }
    end
    
    def build_request
      return "#{@base_url}/#{define_action}.json?#{define_params}"
    end
    
    def define_action
      
    end
    
    def define_params
      res = "apikey=#{@api_key}"
      if @params
        res += "&"+@params.map{ |k,v| k.to_s+'='+URI.escape(v.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
}.join('&')
      end
      return res
    end
    
    def parse_response
      p build_request
      json = Net::HTTP.get(URI.parse(build_request))
      return JSON.parse(json)
    end
    
  end
  
end
