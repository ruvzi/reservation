# == Schema Information
#
# Table name: tables
#
#  id            :bigint           not null, primary key
#  number        :string
#  reserved      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :bigint           not null
#
# Indexes
#
#  index_tables_on_reserved       (reserved)
#  index_tables_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#
class Table < ApplicationRecord
  belongs_to :restaurant

  has_many :table_reservations

  scope :reserved, -> { where(reserved: true) }
  scope :free, -> { where(reserved: false) }

  def reservation!(user, from_time, interval)
    return unless available?(from_time, interval)

    table_reservations.create(user: user, reserved_from: from_time, interval: interval)
  end

  def reserved!
    update(reserved: true)
  end

  def free!
    update(reserved: false)
  end

  def available?(from_time, interval = 1)
    restaurant.open?(from_time) && free?(from_time, interval)
  end

  def free?(from_time, interval = 1)
    table_reservations.reserved(from_time, interval).blank?
  end
end
