class Game < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many  :versions
end
