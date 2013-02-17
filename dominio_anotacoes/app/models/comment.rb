class Comment < ActiveRecord::Base
  attr_accessible :body, :resource_uri
end
