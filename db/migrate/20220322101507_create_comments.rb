class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.references :article, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: true
      t.timestamps
    end
  end
end
