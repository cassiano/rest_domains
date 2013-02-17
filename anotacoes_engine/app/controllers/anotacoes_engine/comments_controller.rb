module AnotacoesEngine
  class CommentsController < ApplicationController
    before_filter :allow_ajax_requests_only
  
    def create
      Comment.create params[:comment]
    
      head :created
    end
  
    private
  
    def allow_ajax_requests_only
      head :forbidden if !request.xhr?
    end
  end
end
