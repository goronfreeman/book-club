class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, :date, presence: true

  def upcoming?
    # check date field vs current date
  end
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
