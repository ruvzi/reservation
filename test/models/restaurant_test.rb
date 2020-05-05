# == Schema Information
#
# Table name: restaurants
#
#  id           :bigint           not null, primary key
#  description  :text
#  name         :string
#  tables_count :integer
#  working_time :json
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
