module ApplicationHelper
  def formatted_date(date)
    date.strftime("%B %d, %Y")
  end

  def formatted_datetime(datetime)
    datetime.strftime("%B %d, %Y %H:%M")
  end

  def appointment_status_text(status)
    status.humanize
  end
end