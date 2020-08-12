# == Schema Information
#
# Table name: webnovels
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Webnovel < ApplicationRecord
  has_many :chapters, -> { order(position: :asc) }, dependent: :destroy
end
