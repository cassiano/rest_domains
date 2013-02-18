# Encoding: UTF-8

module AnotacoesEngine
  module ApplicationHelper
    def render_comments(resource_uri, options = {})
      options.reverse_merge!(
        show_form: false
      )
      
      render partial: '/comments', locals: { resource_uri: resource_uri, show_form: options[:show_form] }
    end
  end
end
