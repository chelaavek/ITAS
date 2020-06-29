class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :position
      t.string :cabinet
      t.string :post_address
      t.string :email
      t.string :phone_number
      t.text :publications
      t.text :researches
      t.text :courses
      t.timestamps
    end
  end
end
