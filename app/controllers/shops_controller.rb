class ShopsController < ApplicationController
  before_action :set_shop, :weekdays, only: :show

  def index
    @shops = Shop.all
  end

  def show
    @schedule = @shop.schedule
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def weekdays
    current_day = daynames.index(today)
    last_days = daynames.drop(current_day)

    @weekdays = last_days + (daynames - last_days)
  end

  def today
    Time.zone.now.strftime('%A')
  end

  def daynames
    Date::DAYNAMES
  end
end
