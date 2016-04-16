class CreateUsernames < ActiveRecord::Migration
  def change
    create_table :usernames do |t|
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
