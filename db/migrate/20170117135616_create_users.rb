class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :phone_number, :string, :null => false
      t.column :name, :string
      t.timestamps
    end
  end
end
