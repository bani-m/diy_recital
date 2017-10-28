class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.text :material
      t.text :production1
      t.text :production2
      t.text :production3


      t.timestamps null: false
    end
  end
end
