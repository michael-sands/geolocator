require "maxminddb"

module Web::Controllers::Home
  class Index
    include Web::Action
    
    def call(params)
      db = MaxMindDB.new('db/GeoLite2-Country.mmdb')
      @result = db.lookup(request.ip)
      
      if @result.found?
        self.status = 200
        self.body = "country: #{@result.country.iso_code}"
      else
        self.status = 404
        self.body = "country: NOT_FOUND"
      end
    end
  end

end
