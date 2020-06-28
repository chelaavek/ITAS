class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :body
      t.belongs_to :admin_user
      t.timestamps
    end
  end
end
