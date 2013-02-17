class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :resource_uri
      t.text :body

      t.timestamps
    end
  end
end
