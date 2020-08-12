# == Schema Information
#
# Table name: chapters
#
#  id          :bigint           not null, primary key
#  name        :string
#  position    :integer
#  url         :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  webnovel_id :bigint           not null
#
# Indexes
#
#  index_chapters_on_webnovel_id  (webnovel_id)
#
# Foreign Keys
#
#  fk_rails_...  (webnovel_id => webnovels.id)
#
require "rails_helper"

RSpec.describe Chapter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
