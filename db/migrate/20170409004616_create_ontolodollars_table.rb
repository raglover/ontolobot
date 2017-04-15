class CreateOntolodollarsTable < ActiveRecord::Migration[5.0]
  def change
      create_table :ontolodollars do |t|
          t.integer :user_id
          t.index :user_id
          t.integer :odollars
      end
  end
end
