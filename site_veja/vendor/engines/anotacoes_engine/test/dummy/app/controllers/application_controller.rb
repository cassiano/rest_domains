class ApplicationController < ActionController::Base
  protect_from_forgery

  helper AnotacoesEngine::Engine.helpers
end
