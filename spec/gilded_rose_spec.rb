require 'rspec'
require 'test/unit/assertions'
require 'gilded_rose'

describe GildedRose do
	def create_and_update_item(item, sell_in, quality)
		items = [Item.new(item, sell_in, quality)]
		GildedRose.new(items).update_quality	
		return items;
	end
	
  describe "#update_quality" do
    it "does not change the name" do
			items = create_and_update_item("foo", 0, 0)
      expect(items[0].name).to eq "foo"
    end
	end

	describe "handles Sulfuras" do
		it "doesn't change the quality of Sulfuras" do
			items = create_and_update_item("Sulfuras, Hand of Ragnaros", 5, 5)
			expect(items[0].quality).to eq 5
		end
  end

	describe "handles Aged Brie" do
		it "lets the quality go up by 2" do
			items = [Item.new("Aged Brie", 0, 0)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by 2
		end
		it "doesn't change quality to a higher value than 50" do
			items = [Item.new("Aged Brie", 0, 50)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by 0
		end
	end

	describe "handles BackStage Passes" do
		it "lets the quality rise 2x if sell_in ≤ 10" do
			items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 5)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by	2
		end
		it "lets the quality rise 3x if sell_in ≤ 5" do
			items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 5)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by	3
		end
		it "sets quality to 0 if sell_in < 0" do
			items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 5)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.to 0
		end
	end
	
	describe "handles other items" do
		it "lets quality decrease by 1 if sell_in ≥ 0" do
			items = [Item.new("foo", 1, 5)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by -1
		end
		it "lets quality decrease by 2 if sell_in < 0" do
			items = [Item.new("foo", -1, 5)]
			expect { GildedRose.new(items).update_quality }.to change { items[0].quality }.by -2
		end
	end
end

