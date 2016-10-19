class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, :voter_id, :post_id

      t.timestamps
    end
  end
end
