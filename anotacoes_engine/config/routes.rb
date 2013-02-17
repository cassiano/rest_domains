AnotacoesEngine::Engine.routes.draw do
  post "comments" => "comments#create", as: :create_comment
end
