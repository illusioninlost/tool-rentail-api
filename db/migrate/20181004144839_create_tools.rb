class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :url
      t.integer :like

      t.timestamps
    end
  end
end
