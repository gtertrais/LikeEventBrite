module AttendancesHelper
  def end_date
    @event.start_date + (@event.duration * 60)
  end
end
