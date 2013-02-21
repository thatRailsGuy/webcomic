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
  attr_accessible :description, :title, :image, :tag_list, :tooltip
  acts_as_taggable
  
  has_attached_file :image, 
    :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" },
    :default_style => :large
  
  def next
    Comic.where("created_at > ?", created_at).order("created_at ASC").first
  end
  
  def next?
    !Comic.where("created_at > ?", created_at).order("created_at ASC").empty?
  end
  
  def prev
    Comic.where("created_at < ?", created_at).order("created_at ASC").last
  end
  
  def prev?
    !Comic.where("created_at < ?", created_at).order("created_at ASC").empty?
  end
end
