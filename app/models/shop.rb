class Shop < ApplicationRecord
  has_one :schedule, dependent: :destroy

  # stores opened on specific day
  # example: Shop.open_on('monday')
  scope :open_on, ->(day) {
    joins(:schedule).where("schedules.#{day} = ?", true)
  }

  # stores closed on specific day
  # example: Shop.close_on('sunday')
  scope :close_on, ->(day) {
    joins(:schedule).where("schedules.#{day} = ?", false)
  }

  # stores opened first hour by day
  # example: Shop.open_first_hour('tuesday', '10:00')
  scope :open_first_hour, ->(day, hour) {
    joins(:schedule).merge(
      Schedule.where(
        "array_to_string(#{day}_hours, '||') ILIKE :hours",
        hours: "#{hour}%"
      )
    )
  }
end
