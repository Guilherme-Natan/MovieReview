module MoviesHelper
  def minutes_to_hours(minutes)
    hours = minutes / 60
    minutes %= 60
    return "#{minutes} #{plural_or_singular("minute", minutes)}" if hours == 0
    return "#{hours} #{plural_or_singular("hour", hours)}" if minutes == 0
    "#{hours} #{plural_or_singular("hour", hours)} and #{minutes} #{plural_or_singular("minute", minutes)}"
  end

  def did_it_flop(movie)
    movie.flop? ? "Floped!" : "Didn't Flop!"
  end
  private

  def plural_or_singular(word, number)
    number == 1 ? word : "#{word}s"
  end
end
