class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
			next if item.name == "Sulfuras, Hand of Ragnaros"
			item.sell_in -= 1 

			next if item_quality_at_boundaries?(item)	
			
			if item.name == "Backstage passes to a TAFKAL80ETC concert"
				handle_quality_backstage(item)
				return
      elsif item.name == "Aged Brie"
				handle_quality_brie(item)
				return
			end

      item.quality -= 1
			item.quality -= 1 if item.sell_in < 0
  	end
	end

	private

	def item_quality_at_boundaries?(item)
		item.quality >= 50 or (item.quality <= 0 and item.name != "Aged Brie")
	end

	def handle_quality_backstage(item)
		item.quality += 2 if item.sell_in < 11
		item.quality += 1 if item.sell_in < 6
		item.quality = 0 if item.sell_in < 0
	end

	def handle_quality_brie(item)
		item.quality += 1
		item.quality += 1 if item.sell_in < 0
	end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
