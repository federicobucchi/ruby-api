class Connections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to :member, index: true
      t.string :name
      t.string :lastname
      t.string :email
    end
  end
end
