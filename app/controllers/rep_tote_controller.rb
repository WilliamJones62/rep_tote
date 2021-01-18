class RepToteController < ApplicationController
  def retnj
    set_variables 'RET', 'NJ'
  end

  def retil
    set_variables 'RET', 'IL'
  end

  def fs
    set_variables 'FS', 'ALL'
  end

  def fsnj
    set_variables 'FS', 'NJ'
  end

  def fsil
    set_variables 'FS', 'IL'
  end

  def fsga
    set_variables 'FS', 'GA'
  end

  def fstx
    set_variables 'FS', 'TX'
  end

  def fsco
    set_variables 'FS', 'CO'
  end

  def set_variables (channel, cost_center)
    if cost_center == 'ALL'
      main = Holidaybird.where(channel: channel).all
    else
      main = Holidaybird.where(channel: channel, cc: cost_center).all
    end
    @main = []
    if cost_center == 'ALL'
      sorted = main.sort_by &:sku
      bird = sorted.first
      shipped = 0
      ordered = 0
      adjustment = 0
      forecast = 0
      harvest = 0
      sorted.each do |s|
        if s.sku == bird.sku
          shipped += s.shipped
          ordered += s.ordered
          adjustment += s.adjustment
          forecast += s.forecast
          harvest += s.harvest
        else
          bird.shipped = shipped
          bird.ordered = ordered
          bird.adjustment = adjustment
          bird.forecast = forecast
          bird.harvest = harvest
          @main.push(bird)
          bird = s
          shipped = s.shipped
          ordered = s.ordered
          adjustment = s.adjustment
          forecast = s.forecast
          harvest = s.harvest
        end
      end
      bird.shipped = shipped
      bird.ordered = ordered
      bird.adjustment = adjustment
      bird.forecast = forecast
      bird.harvest = harvest
      @main.push(bird)
    else
      @main = main.sort_by &:sku
    end
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    date = first.datetime
  end
end
