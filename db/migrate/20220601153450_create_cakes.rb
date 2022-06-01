class CreateCakes < ActiveRecord::Migration[7.0.3]
  def up
    create_table :cakes do |t|
      t.string :id
      t.string :name
    end
  end
  
  def down
    drop_table :cakes
  end

end
