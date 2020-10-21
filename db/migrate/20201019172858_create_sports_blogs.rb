class CreateSportsBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :sports_blogs do |t|
      t.string :title
      t.text :body
      t.integer :status
      t.text :main_image

      t.timestamps
    end
  end
end
