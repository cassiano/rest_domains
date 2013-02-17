class Article < ActiveRecord::Base
  attr_accessible :body, :subtitle, :title
  
  # Validations.
  validates_presence_of :body, :subtitle, :title
  
  # Callbacks.
  before_create :generate_slug
  
  def generate_slug
    self.slug = title.parameterize
  end
  
  def to_param
    slug
  end
  
  # Scopes.
  scope :from_brand, lambda { |brand| where(brand: brand) }

  private
  
  def self.relation
    relation_class.new(self, arel_table)
  end
  
  def self.relation_class
    @relation_class ||= Class.new(ActiveRecord::Relation) do
      def find_one(id_or_slug)
        find_by_slug(id_or_slug) || super
      end

      def find_some(ids_or_slugs)
        (collection = find_all_by_slug(ids_or_slugs)).any? ? collection : super
      end
    end
  end
end
