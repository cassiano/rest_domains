module EditorialEngine
  class Article < OpenStruct
    DOMAIN_URL = 'http://editorial.api.alexandria.abril.com.br:3001'
    CREDENTIALS = { username: 'veja', password: 'pwd' }
  
    def self.find(slug)
      begin
        # response = HTTParty.get(id = uri_from_slug(slug), basic_auth: CREDENTIALS, query: { format: :json })
        response = HTTParty.get(id = uri_from_slug(slug), basic_auth: CREDENTIALS, query: { format: :xml })
      rescue Errno::ECONNREFUSED
      end
    
      if response && response.code == 200 
        # new JSON.parse(response.body).merge(id: id)
        new Hash.from_xml(response.body)['article'].merge(id: id)
      else
        nil
      end
    end
  
    def self.uri_from_slug(slug)
      "#{DOMAIN_URL}/articles/#{slug}"
    end
  
    def self.latest(limit = 3)
      begin
        response = HTTParty.get("#{DOMAIN_URL}/articles/latest.json", basic_auth: CREDENTIALS, query: { limit: limit })
      rescue Errno::ECONNREFUSED
      end
    
      if response && response.code == 200 
        JSON.parse(response.body).map { |attr| new attr }
      else
        []
      end
    end
  end
end
