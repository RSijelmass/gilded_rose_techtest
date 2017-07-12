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

	describe "Handles Sulfuras" do
		it "doesn't change the quality of Sulfuras" do
			items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 5)]		
			GildedRose.new(items).update_quality
			expect(items[0].quality).to eq 5
		end
  end

end

