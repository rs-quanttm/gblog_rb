class EditDefaultEnumToUsers < ActiveRecord::Migration[7.0]
  def change
    User.where.not(id: 1).update_all(roles: User.roles["User"])
    change_column_default :users, :roles, User.roles["User"]
  end
end
