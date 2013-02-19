class ResourceController < ApplicationController
  def show_comments
    @resource_uri = 'http://editorial.api.alexandria.abril.com.br:3001/articles/obama-pede-gasto-p-blico-para-classe-m-dia-prosperar'
  end
end
