module AnotacoesEngine
  module ApplicationHelper
    def render_comments(resource_uri, options = {})
      options.reverse_merge!(
        show_form: true
      )
      
      render partial: '/comments', locals: { comments: Comment.search(resource_uri), resource_uri: resource_uri, show_form: options[:show_form] }
    end
    
    def anotacoes_domain_alive?
      Comment.domain_alive?
    end
  end
end
