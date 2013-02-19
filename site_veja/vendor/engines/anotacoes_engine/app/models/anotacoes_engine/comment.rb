module AnotacoesEngine
  class Comment < OpenStruct
    DOMAIN_URL = 'http://anotacoes.api.alexandria.abril.com.br:3002'
  
    def self.search(resource_uri)
      begin
        response = HTTParty.get("#{DOMAIN_URL}/comments/search.json", query: { resource_uri: resource_uri })
      rescue Errno::ECONNREFUSED
      end
    
      if response && response.code == 200
        JSON.parse(response.body).map { |comment_attr| new comment_attr }
      else
        []
      end
    end
  
    def self.create(attributes)
      begin
        response = HTTParty.post("#{DOMAIN_URL}/comments.json", body: { comment: attributes })
      rescue Errno::ECONNREFUSED
      end
    
      if response && response.code == 201
        new JSON.parse(response.body)
      else
        nil
      end
    end
    
    def self.domain_alive?
      begin
        response = HTTParty.get("#{DOMAIN_URL}/alive")
      rescue Errno::ECONNREFUSED
      end
    
      response && response.code == 200
    end
  end
end
