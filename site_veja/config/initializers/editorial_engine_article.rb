# Load the EditorialEngine::Article class before reopening it.
require 'editorial_engine/article'

class EditorialEngine::Article
  def comments
    @comments ||= AnotacoesEngine::Comment.search(id)
  end
end
