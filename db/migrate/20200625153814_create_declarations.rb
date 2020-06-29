class CreateDeclarations < ActiveRecord::Migration[6.0]
  def change
    create_table :declarations do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
