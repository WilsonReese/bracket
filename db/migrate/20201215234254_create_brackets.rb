class CreateBrackets < ActiveRecord::Migration[6.0]
  def change
    create_table :brackets do |t|
      t.integer :number_of_entries
      t.integer :manager_id
      t.string :status

      t.timestamps
    end
  end
end
