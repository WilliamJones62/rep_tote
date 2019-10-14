class RepToteController < ApplicationController
  def retnj
    set_variables 'RET', 'NJ'
  end

  def retil
    set_variables 'RET', 'IL'
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
    main = Holidaybird.where(channel: channel, cc: cost_center).all
    @main = []
    # main.each do |m|
    #   if m.forecast != 0 || m.harvest != 0
    #     @main.push(m)
    #   end
    # end
    # @main = @main.sort_by &:sku
    @main = main.sort_by &:sku
    @date = get_db_timestamp
  end

  def get_db_timestamp
    first = Holidaybird.first
    date = first.datetime
  end
end
