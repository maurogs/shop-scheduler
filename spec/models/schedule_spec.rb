require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:shop) { Shop.create(name: 'store') }

  before(:each) { I18n.locale = :en }

  it 'should create a new schedule object' do
    schedule = Schedule.new

    expect(schedule).to be_a Schedule
  end

  it 'should respond to his fields' do
    schedule = Schedule.new

    expect(schedule).to respond_to(:monday)
    expect(schedule).to respond_to(:monday_hours)
    expect(schedule).to respond_to(:sunday)
    expect(schedule).to respond_to(:sunday_hours)
  end

  it 'should not create a schedule without shop association' do
    schedule = Schedule.new(monday: false, tuesday: true)

    expect(schedule.valid?).to be false
    expect(schedule.errors.messages[:shop]).to include('must exist')
  end

  it 'should create a schedule with shop association' do
    schedule = Schedule.new(shop_id: shop.id, monday: false, tuesday: true)

    expect(schedule.valid?).to be true
    expect(schedule.errors.messages[:shop]).to be_empty
  end

  it 'should not create hours with duplicated fields' do
    wrong_hours = ["10:00-12:00", "10:00-12:00"]
    schedule = Schedule.new(shop_id: shop.id, monday: false, monday_hours: wrong_hours)

    expect(schedule.valid?).to be false
    expect(schedule.errors.messages[:hours]).to include("Hours are duplicated")
  end

  it 'should not create hours with overlapped hours' do
    wrong_hours = ["10:00-12:00", "12:00-15:00"]
    schedule = Schedule.new(shop_id: shop.id, monday: false, monday_hours: wrong_hours)

    expect(schedule.valid?).to be false
    expect(schedule.errors.messages[:hours]).to include("Hours are overlapped")
  end

  it 'should not create hours with empty hours' do
    wrong_hours = [""]
    schedule = Schedule.new(shop_id: shop.id, monday: false, monday_hours: wrong_hours)

    expect(schedule.valid?).to be false
    expect(schedule.errors.messages[:hours]).to include("Hours are empty")
  end

  it 'should create a schedule with valid hours' do
    hours = ["10:00-12:00", "15:00-20:00"]
    schedule = Schedule.new(shop_id: shop.id, monday: false, monday_hours: hours)

    expect(schedule.valid?).to be true
    expect(schedule.errors.messages[:hours]).to be_empty
    expect(schedule.errors.messages[:hours]).to be_blank
  end
end
