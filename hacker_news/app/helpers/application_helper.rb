module ApplicationHelper

  def my_date(time_object)
    time_object.strftime("Created at: %m/%d/%Y")
  end

  def elapsed_time(datetime)
    current_time = Time.now
    distance_of_time_in_words(current_time, datetime)
  end

end
