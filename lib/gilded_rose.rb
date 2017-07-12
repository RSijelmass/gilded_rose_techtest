class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
			next if item.name == "Sulfuras, Hand of Ragnaros"
			item.sell_in -= 1 

			next if item_quality_at_boundaries?(item)	
			
			# if item is others
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      # if item is others
            item.quality = item.quality - 1
			# if item is Aged Brie or Backstage
      else
			# increasing quality + 1		
          item.quality = item.quality + 1
			# if item is Backstage
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
      # sell in ≤10
						if item.sell_in < 11
      # increase quality + 1
								item.quality = item.quality + 1
            end
      # sell in ≤ 5
			 			if item.sell_in < 6
			#increase quality + 1
                item.quality = item.quality + 1
            end
          end
      end
			# if item is other, Brie, Backstage
      if item.name != "Sulfuras, Hand of Ragnaros"
      end
			# if sell in < 0
      if item.sell_in < 0
			# if item is Sulfuras or other
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
			# checking quality boundaries
			# if item is other
              if item.name != "Sulfuras, Hand of Ragnaros"
      # descreasing quality - 1
								item.quality = item.quality - 1
              end
			# if item is Backstage
          else
            item.quality = item.quality - item.quality
          end
			# if item is Aged Brie
        else
			# checking quality boundaries
            item.quality = item.quality + 1
        end
      end
    end
  end

	def item_quality_at_boundaries?(item)
		item.quality >= 50 or (item.quality <= 0 and item.name != "Aged Brie")
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
