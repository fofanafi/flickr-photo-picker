class CreateFlickrPhotos < ActiveRecord::Migration
  def self.up
    create_table :flickr_photos do |t|
      t.string :flickrid
      t.string :secret
      t.string :url_sq
      t.string :photopage

      t.timestamps
    end
  end

  def self.down
    drop_table :flickr_photos
  end
end
