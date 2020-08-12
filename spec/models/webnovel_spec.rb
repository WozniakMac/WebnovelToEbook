# == Schema Information
#
# Table name: webnovels
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Webnovel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
