class CreateEndTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :end_times do |t|

      t.timestamps
    end
  end
end
