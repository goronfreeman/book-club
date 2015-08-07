class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :description
      t.string :category
      t.string :url

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
