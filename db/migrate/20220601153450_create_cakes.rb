class CreateCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :cake_name
    end
  end
end