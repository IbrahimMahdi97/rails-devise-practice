class Imaage < ApplicationRecord
  
  belongs_to :albums
  has_one_attached :image
end
