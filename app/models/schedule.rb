class Schedule < ApplicationRecord
  belongs_to :shop

  validate :valid_hours   

  def is_open?(day)
    send(day.downcase)
  end

  def hours(day)
    send(day.downcase + '_hours')
  end

  private

  def valid_hours
    Date::DAYNAMES.each do |day|
      hours_hand = hours(day)
      next if hours_hand.nil?      
      next errors_hours("Hours are duplicated") if hours_hand != hours_hand.uniq
      next errors_hours("Hours are empty") if !hours_hand.all?(&:present?)

      if hours_hand.length > 1 && overlapped?(hours_hand.first, hours_hand.last)
        errors_hours("Hours are overlapped")
      end
    end
  end

  def errors_hours(msg)
    errors.add(:hours, msg)
  end

  def overlapped?(range_one, range_two)
    first = range_one.split('-')
    last = range_two.split('-')

    (first[0]..first[1]).overlaps?(last[0]..last[1])
  end
end
