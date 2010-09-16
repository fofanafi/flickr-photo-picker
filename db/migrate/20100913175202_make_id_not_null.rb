class MakeIdNotNull < ActiveRecord::Migration
  def self.up
		change_column(:flickr_photos, :flickrid, :string, {:null => false})
  end

  def self.down
  end
end
