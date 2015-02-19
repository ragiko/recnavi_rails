class CreateResisters < ActiveRecord::Migration
  def change
    create_table :resisters do |t|
      t.references :users, index: true
      t.references :corporation, index: true

      t.timestamps
    end
  end
end
