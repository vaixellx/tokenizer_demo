class AddTables < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.timestamps
    end

    create_table :action_tokens do |t|
      t.string :token
      t.timestamps
    end

    create_table :login_tokens do |t|
      t.string :token
      t.timestamps
    end

    create_table :tickets do |t|
      t.string :email
      t.string :ref_code
      t.timestamps
    end
  end
end
