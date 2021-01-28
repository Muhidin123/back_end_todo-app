class ChangeColumnOnNotes < ActiveRecord::Migration[6.0]
  def change
    change_table :notes do |t|
      t.change :due_date, :string
    end
  end
end
