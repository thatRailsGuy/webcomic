# == Schema Information
#
# Table name: comics
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Comic < ActiveRecord::Base
  attr_accessible :description, :title, :image
  has_attached_file :image
end
