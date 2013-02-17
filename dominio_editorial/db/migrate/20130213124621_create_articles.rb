class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :brand
      t.string :title
      t.string :subtitle
      t.string :slug
      t.text :body

      t.timestamps
    end
  end
end
