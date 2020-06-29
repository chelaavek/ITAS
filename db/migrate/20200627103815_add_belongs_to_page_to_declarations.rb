class AddBelongsToPageToDeclarations < ActiveRecord::Migration[6.0]
  def change
    add_column :declarations, :belongs_to_page, :string, default: 'declarations', null: false
  end
end
