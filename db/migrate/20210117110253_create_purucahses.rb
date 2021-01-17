class CreatePurucahses < ActiveRecord::Migration[6.0]
  def change
    create_table :purucahses do |t|
      t.references :user, null: false,foreign_key: true
      t.references :item, null: false,foreigin_key: true
      t.timestamps
    end
  end
end
