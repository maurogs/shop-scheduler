class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.boolean :monday, default: false
      t.boolean :tuesday, default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday, default: false
      t.boolean :friday, default: false
      t.boolean :saturday, default: false
      t.boolean :sunday, default: false
      t.string :monday_hours, array: true
      t.string :tuesday_hours, array: true
      t.string :wednesday_hours, array: true
      t.string :thursday_hours, array: true
      t.string :friday_hours, array: true
      t.string :saturday_hours, array: true
      t.string :sunday_hours, array: true      
      t.references :shop, index: true, null: false
      t.timestamps
    end
  end
end
