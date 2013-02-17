module AnotacoesEngine
  class Comment < OpenStruct
    DOMAIN_URL = 'http://anotacoes.api.alexandria.abril.com.br:3002'
  
    def self.search(resource_uri)
      response = HTTParty.get("#{DOMAIN_URL}/comments/search.json", query: { resource_uri: resource_uri }) rescue nil
    
      if response && response.code == 200
        JSON.parse(response.body).map { |comment_attr| new comment_attr }
      else
        []
      end
    end
  
    def self.create(attributes)
      response = HTTParty.post("#{DOMAIN_URL}/comments.json", body: { comment: attributes }) rescue nil
    
      if response && response.code == 201
        new JSON.parse(response.body)
      else
        nil
      end
    end
  end
end
