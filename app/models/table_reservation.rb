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
class TableReservation < ApplicationRecord
  ONE_INTERVAl = 30.freeze
  belongs_to :table
  belongs_to :user

  scope :reserved, ->(from_time, interval){ where('reserved_from <= ? or reserved_to > ?', from_time, from_time + interval * ONE_INTERVAl) }

  after_create :table_reserved!

  def interval=(val)
    self.reserved_to = reserved_from + (val.to_i * ONE_INTERVAl).minutes
  end

  private

  def table_reserved!
    table.reserved!
  end
end
