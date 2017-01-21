class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.column :model, :string
      t.column :reg_no, :string, :null => false
      t.timestamps
    end
  end
end
