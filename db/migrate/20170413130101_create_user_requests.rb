class CreateUserRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :user_requests do |t|
      t.string :text
      t.belongs_to :user

      t.timestamps
    end
  end
end
