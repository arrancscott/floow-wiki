class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content, limit: 16777215
      t.integer :user_id

      t.timestamps
    end
  end
end
