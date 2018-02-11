class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.references :post, index: true, foreign_key: true
    end
  end
end
