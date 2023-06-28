class ChangeSchemaV1 < ActiveRecord::Migration[6.0]
  def change
  
  
    create_table :users do |t|
      t.datetime :locked_at
      t.integer :failed_attempts, default: 0, null: false
      t.integer :sign_in_count, default: 0, null: false
      t.string :reset_password_token
      t.string :last_sign_in_ip
      t.string :unlock_token
      t.datetime :reset_password_sent_at
      t.string :password_confirmation
      t.datetime :remember_created_at
      t.string :current_sign_in_ip
      t.string :email, default: '', null: false
      t.integer :roles, default: 0
      t.string :password
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :encrypted_password, default: '', null: false
      t.timestamps null: false
    end
  
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.timestamps null: false
    end
  
    create_table :comments do |t|
      t.string :content
      t.timestamps null: false
    end
  
    create_table :likes do |t|
      t.timestamps null: false
    end
  
    create_table :tags do |t|
      t.string :content
      t.timestamps null: false
    end
  
    create_table :posttaggings do |t|
      t.timestamps null: false
    end
  
    add_reference :posts, :user, foreign_key: true
  
    add_reference :comments, :user, foreign_key: true
  
    add_reference :posttaggings, :tag, foreign_key: true
  
    add_reference :comments, :post, foreign_key: true
  
    add_reference :likes, :post, foreign_key: true
  
    add_reference :posttaggings, :post, foreign_key: true
  
    add_reference :likes, :user, foreign_key: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :email, unique: true
  end
end
