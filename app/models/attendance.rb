class Attendance < ApplicationRecord
  belongs_to :user

  def working?
    clock_in.present? && clock_out.nil?
  end
end
