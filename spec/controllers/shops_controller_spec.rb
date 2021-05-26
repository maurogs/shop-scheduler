require 'rails_helper'

RSpec.describe ShopsController do
  let(:shop) { Shop.create(name: 'store') }

  describe "index" do
    it "assigns the @shops" do
      get :index
      expect(assigns(:shops)).to eq([shop])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "show" do
    it "assigns the @schedule" do
      schedule = Schedule.create(shop_id: shop.id)

      get :show, params: { id: shop.id }
      expect(assigns(:schedule)).to eq(schedule)
    end

    it "renders the show template" do
      get :show, params: { id: shop.id }
      expect(response).to render_template("show")
    end

    it "return the sorted weekdays" do
      get :show, params: { id: shop.id }
      today = Time.zone.now.strftime('%A')
      yesterday = (Time.zone.now - 1.day).strftime('%A')

      expect(assigns(:weekdays).length).to eq(7)
      expect(assigns(:weekdays).first).to eq(today)
      expect(assigns(:weekdays).last).to eq(yesterday)
    end
  end
end
