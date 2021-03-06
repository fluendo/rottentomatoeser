module RottenTomatoes

  require 'uri'
  
  class API
    
    def initialize(options)
      @api_key = options[:api_key]
      @base_url = options[:base_url] || "http://api.rottentomatoes.com/api/public/v1.0"
      @debug = options[:debug] || false
      @params = options.delete_if{ |k,v| [:api_key, :base_url, :debug].include?(k) }
    end
    
    def build_request
      return "#{@base_url}/#{define_action}.json?#{define_params}"
    end
    
    def define_action
      # to be define in child class
    end
    
    def define_params
      res = "apikey=#{@api_key}"
      if !@params.empty?
        res += "&"+@params.map{ |k,v| k.to_s+'='+URI.escape(v.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
}.join('&')
      end
      return res
    end
    
    def parse_response
      build_request if @debug
      json = Net::HTTP.get(URI.parse(build_request))
      return JSON.parse(json)
    end
    
  end
  
end
