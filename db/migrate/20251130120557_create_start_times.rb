class CreateStartTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :start_times do |t|

      t.timestamps
    end
  end
end
