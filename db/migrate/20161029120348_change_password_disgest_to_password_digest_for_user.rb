class ChangePasswordDisgestToPasswordDigestForUser < ActiveRecord::Migration
  def change
  	rename_column :users, :password_disgest, :password_digest
  end
end
