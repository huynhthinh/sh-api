class CreateUsersUsergroupsLinkTable < ActiveRecord::Migration
  def change
    create_table :users_usergroups do |t|
      t.belongs_to :usergroup
      t.belongs_to :user
    end
  end
  # def up
  #   create_table :users_usergroups do |t|
  #     t.belongs_to :usergroup
  #     t.belongs_to :user
  #   end
  # end
  #
  # def down
  #   drop_table :users_usergroups
  # end
end
