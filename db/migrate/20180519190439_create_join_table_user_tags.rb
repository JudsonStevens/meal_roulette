class CreateJoinTableUserTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :tags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.integer :preference
      # t.index [:user_id, :tag_id]
      # t.index [:tag_id, :user_id]

      t.timestamps
    end
  end
end
