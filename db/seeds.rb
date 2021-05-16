# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


shop_one = Shop.create(name: 'ikea')
shop_two = Shop.create(name: 'carrefour')

schedule_one = Schedule.create(
  monday: false,
  tuesday: true,
  wednesday: true,
  thursday: true,
  friday: true,
  saturday: true,
  sunday: false,

  monday_hours: nil,
  tuesday_hours: ["10:00-12:00", "15:00-19:00"],
  wednesday_hours: ["10:00-12:00", "15:00-19:00"],
  thursday_hours: ["10:00-12:00", "15:00-19:00"],
  friday_hours: ["10:00-12:00", "15:00-19:00"],
  saturday_hours: ["10:00-14:00"],
  sunday_hours: nil
)
shop_one.schedule = schedule_one

schedule_two = Schedule.create(
    monday: true,
    tuesday: true,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: true,
    sunday: false,

    monday_hours: ["09:00-12:00", "15:00-19:00"],
    tuesday_hours: ["09:00-12:00", "15:00-19:00"],
    wednesday_hours: ["09:00-16:00"],
    thursday_hours: ["09:00-12:00", "15:00-19:00"],
    friday_hours: ["09:00-12:00", "15:00-19:00"],
    saturday_hours: ["09:00-15:00"],
    sunday_hours: nil
  )
shop_two.schedule = schedule_two
