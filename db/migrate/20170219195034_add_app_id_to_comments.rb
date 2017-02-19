class AddAppIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :app_id, :integer
  end
end
