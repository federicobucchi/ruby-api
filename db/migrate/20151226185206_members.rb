class Members < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :lastname
      t.string :email
    end
  end
end
