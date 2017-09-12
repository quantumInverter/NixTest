class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to :votable
      t.belongs_to :user

      t.timestamps
    end

    add_index :votes, [:votable_id, :user_id], unique: true
  end
end
