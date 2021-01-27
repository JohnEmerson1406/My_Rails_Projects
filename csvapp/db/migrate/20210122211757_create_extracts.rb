class CreateExtracts < ActiveRecord::Migration[6.1]
  def change
    create_table :extracts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :movement
      t.integer :kind
      t.float :value

      t.timestamps
    end
  end
end
