class AddIsPublishedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_published, :boolean
  end
end
