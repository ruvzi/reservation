# == Schema Information
#
# Table name: table_reservations
#
#  id            :bigint           not null, primary key
#  reserved_from :datetime
#  reserved_to   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  table_id      :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_table_reservations_on_table_id  (table_id)
#  index_table_reservations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (table_id => tables.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class TableReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
