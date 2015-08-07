class Resource < ActiveRecord::Base
  belongs_to :user
  validates :description, :category, :url, presence: true
end

# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  description :text(65535)
#  category    :string(255)
#  url         :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
