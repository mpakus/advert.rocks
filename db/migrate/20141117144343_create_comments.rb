class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.references :user,  index: true
      t.references :video, index: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
