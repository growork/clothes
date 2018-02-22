class Thing_collection
  def initialize(current_path, temp)
    @temp = temp
    @list_of_files = Dir.glob(current_path + "/data/*.txt")

    # Создание массива с содержимым файлов
    @thing_info = []
    @list_of_files.each_with_index do |path_to_file, i|
      @thing_info[i] = IO.readlines(path_to_file)
    end
    @thing = Thing.new
    types_of_things
  end

  # Метод сортировки вещей по типу
  def types_of_things
    @hat = []
    @footwear = []
    @body = []
    @pants = []
    @hand = []
    @spacesuit = []
    @thing_info.each do |item|
      if item[1].chomp == "Головной убор"
        @hat << item
      elsif item[1].chomp == "Тело"
        @body << item
      elsif item[1].chomp == "Штаны"
        @pants << item
      elsif item[1].chomp == "Обувь"
        @footwear << item
      elsif item[1].chomp == "Кисти"
        @hand << item
      else
        @spacesuit << item
      end
    end
  end

  def set_hat
    @hat_for_weather = []
    @hat.each do |item|
      @hat_for_weather << item if @thing.for_the_weather?(@temp, item)
    end
  end

  def set_body
    @body_for_weather = []
    @body.each do |item|
      @body_for_weather << item if @thing.for_the_weather?(@temp, item)
    end
  end

  def set_pants
    @pants_for_weather = []
    @pants.each do |item|
      @pants_for_weather << item if @thing.for_the_weather?(@temp, item)
    end
  end

  def set_footwear
    @footwear_for_weather = []
    @footwear.each do |item|
      @footwear_for_weather << item if @thing.for_the_weather?(@temp, item)
    end
  end

  def set_hand
    @hand_for_weather = []
    @hand.each do |item|
      @hand_for_weather << item if @thing.for_the_weather?(@temp, item)
    end
  end

  def one_type_of_thing
    if !@hat_for_weather.empty?
      @hat_for_weather.compact!
      if @hat_for_weather.size > 1
        @result_hat = @hat_for_weather.sample
      else
        @result_hat = @hat_for_weather[0]
      end
    else
      @result_hat = []
    end

    if !@body_for_weather.empty?
      @body_for_weather.compact!
      if @body_for_weather.size > 1
        @result_body = @body_for_weather.sample
      else
        @result_body = @body_for_weather[0]
      end
    else
      @result_body = []
    end

    if !@pants_for_weather.empty?
      @pants_for_weather.compact!
      if @pants_for_weather.size > 1
        @result_pants = @pants_for_weather.sample
      else
        @result_pants = @pants_for_weather[0]
      end
    else
      @result_pants = []
    end

    if !@footwear_for_weather.empty?
      @footwear_for_weather.compact!
      if @footwear_for_weather.size > 1
        @result_footwear = @footwear_for_weather.sample
      else
        @result_footwear = @footwear_for_weather[0]
      end
    else
      @result_footwear = []
    end

    if !@hand_for_weather.empty?
      @hand_for_weather.compact!
      if @footwear_for_weather.size > 1
        @result_hand = @hand_for_weather.sample
      else
        @result_hand = @hand_for_weather[0]
      end
    else
      @result_hand = []
    end
  end

  def print_set
    set_hat
    set_body
    set_pants
    set_footwear
    set_hand
    one_type_of_thing

    puts "Предлагаем сегодня надеть:"
    puts
    if !@result_hat.empty?
    puts "#{@result_hat[0].to_s.chomp} (#{@result_hat[1].to_s.chomp})," +
           "#{(@thing.cut_off_excess(@result_hat[2]))[0]..(@thing.cut_off_excess(@result_hat[2]))[1]}"
    else
      puts "Подходящего головного убора нет!"
    end

    if !@result_body.empty?
    puts "#{@result_body[0].chomp} (#{@result_body[1].chomp}), " +
           "#{(@thing.cut_off_excess(@result_body[2]))[0]..(@thing.cut_off_excess(@result_body[2]))[1]}"
    else
      puts "Подходящей нателки нет!"
    end

    if !@result_pants.empty?
    puts "#{@result_pants[0].chomp} (#{@result_pants[1].chomp}), " +
           "#{(@thing.cut_off_excess(@result_pants[2]))[0]..(@thing.cut_off_excess(@result_pants[2]))[1]}"
    else
      puts "Подходящих штанов нет!"
    end

    if !@result_footwear.empty?
    puts "#{@result_footwear[0].chomp} (#{@result_footwear[1].chomp}), " +
           "#{(@thing.cut_off_excess(@result_footwear[2]))[0]..(@thing.cut_off_excess(@result_footwear[2]))[1]}"
    else
      puts "Подходящей обуви нет!"
    end

    if !@result_hand.empty?
    puts "#{@result_hand[0].chomp} (#{@result_hand[1].chomp}), " +
           "#{(@thing.cut_off_excess(@result_hand[2]))[0]..(@thing.cut_off_excess(@result_hand[2]))[1]}"
    else
      puts "Подходящих перчаток нет!"
    end
  end
end
