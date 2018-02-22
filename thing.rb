class Thing
  def for_the_weather?(temp, item)
    temp_range2 = cut_off_excess(item[2].to_s)
    b = (temp_range2[0].to_i..temp_range2[1].to_i).to_a
    b.include?(temp.to_i)# Вещи по погоде?
  end

  def cut_off_excess(init_range)
    temp_range = init_range.split(", ") # Вытаскиваем диапазон температур в массив ["first", "last"]
    temp_range.each { |i| i.delete!("()")}
    temp_range.reject!(&:empty?)               # Обрезаем пустые элементы
    temp_range.each { |i| i.delete!("+") }     # Обрезаем все "+"
    temp_range
  end
end
