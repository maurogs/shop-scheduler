class Schedule < ApplicationRecord
  belongs_to :shop

  validate :hours_should_be_unique,
    :hours_should_not_be_overlapped,
    :hours_should_not_be_empty    

  def is_open?(day)
    send(day.downcase)
  end

  def hours(day)
    send(day.downcase + '_hours')
  end

  private

  def hours_should_be_unique
    Date::DAYNAMES.each do |day|
      hours_hand = hours(day)
      next if hours_hand.nil? || hours_hand == hours_hand.uniq

      errors.add(:hours, "Hours are duplicated")
    end
  end

  def hours_should_not_be_overlapped
    Date::DAYNAMES.each do |day|
      hours_hand = hours(day)
      next if hours_hand.nil? || hours_hand.length <= 1
      next unless overlapped?(hours_hand.first, hours_hand.last)

      errors.add(:hours, "Hours are overlapped")
    end
  end

  def hours_should_not_be_empty
    Date::DAYNAMES.each do |day|
      hours_hand = hours(day)
      next if hours_hand.nil? || hours_hand.all?(&:present?)

      errors.add(:hours, "Hours are empty")
    end
  end

  def overlapped?(range_one, range_two)
    first = range_one.split('-')
    last = range_two.split('-')

    (first[0]..first[1]).overlaps?(last[0]..last[1])
  end
end
