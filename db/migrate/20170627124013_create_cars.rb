class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string   :name
      t.float    :max_speed
      t.string   :slug
    end
    add_index :cars, :slug, unique: :true
  end
end
