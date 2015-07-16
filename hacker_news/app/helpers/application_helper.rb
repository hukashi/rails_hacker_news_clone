module ApplicationHelper

  def my_date(time_object)
    time_object.strftime("Created at: %m/%d/%Y")
  end

end
