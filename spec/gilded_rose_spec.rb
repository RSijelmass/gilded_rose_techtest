require 'rspec'
require 'test/unit/assertions'
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end
	end

	describe "handles Sulfuras" do
		it "doesn't change the quality of Sulfuras" do
			items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 5)]		
			GildedRose.new(items).update_quality
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

end

