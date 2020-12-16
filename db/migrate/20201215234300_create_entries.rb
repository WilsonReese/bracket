class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :bracket_id
      t.string :status
      t.string :title

      t.timestamps
    end
  end
end
