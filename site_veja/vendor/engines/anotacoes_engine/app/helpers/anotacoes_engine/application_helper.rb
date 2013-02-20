module AnotacoesEngine
  module ApplicationHelper
    def render_comments(resource_uri, options = {}, &block)
      options.reverse_merge!(
        show_form: true
      )
      
      comments = Comment.search(resource_uri)
      
      if block
        capture resource_uri, comments, options, &block
      else
        render partial: '/comments', locals: { resource_uri: resource_uri, comments: comments, show_form: options[:show_form] }
      end
    end
    
    def anotacoes_domain_alive?
      Comment.domain_alive?
    end
  end
end
