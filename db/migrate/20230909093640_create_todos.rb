class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :user
      t.string :title
      t.string :description
      t.datetime :deadline
      t.integer :price
      t.datetime :achieved_at
      t.datetime :failed_at
      t.boolean :published
      t.references :judger, index:true, foreign_key: { to_table: :users }
      t.string :how_to_judge

      t.timestamps
    end
  end
end
