class Event < ActiveRecord::Base
  # scope :upcoming, ->(num_events) { order('created_at DESC').limit(num_events) }
  belongs_to :user
  validates :title, :content, :date, presence: true
end

# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  presenter  :string(255)
#  date       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
