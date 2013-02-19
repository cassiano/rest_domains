Rails.application.routes.draw do

  get "resource/show_comments"

  mount AnotacoesEngine::Engine => "/anotacoes_engine"
end
