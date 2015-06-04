class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :brand, index: true
      t.references :clothing_type, index: true

      t.timestamps
    end
  end
end
