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
class Restaurant < ApplicationRecord
  has_many :tables

  validates :name, presence: true, uniqueness: true

  before_create :add_working_time!

  def open?(time = Time.current)
    wday = time.wday.to_s
    current_working = working_time[wday]
    open_form_time = Time.parse(current_working['from'.freeze])
    open_to_time = Time.parse(current_working['to'.freeze])
    open_to_time += 24.hours if open_form_time > open_to_time
    time > open_form_time && time < open_to_time
  end

  private

  def add_working_time!
    self.working_time ||= default_working_time
  end

  def default_working_time
    from_time = '10:30'.freeze
    to_time = '02:00'.freeze
    day_names = I18n.t('date.day_names'.freeze)
    {
      '1': { day: day_names[1], from: from_time, to: to_time },
      '2': { day: day_names[2], from: from_time, to: to_time },
      '3': { day: day_names[3], from: from_time, to: to_time },
      '4': { day: day_names[4], from: from_time, to: to_time },
      '5': { day: day_names[5], from: from_time, to: to_time },
      '6': { day: day_names[6], from: from_time, to: to_time },
      '7': { day: day_names[0], from: from_time, to: to_time }
    }
  end
end
