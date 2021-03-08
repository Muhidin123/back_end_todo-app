class AddColumnCatToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :category, :string unless column_exists??
  end
end
