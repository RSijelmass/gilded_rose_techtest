Gilded Rose Tech Test
====================

A practice tech test battling the famous Gilded Rose problem, refactoring legacy
code with massive and horrendous if-else statements into a more readable set-up.


Initially downloaded the existing code from ...
Downloaded an initial failing rspec-test ("it does not change the name"), and fixed
it.

### How to run the program
- Ruby (version)
- Rspec
- commands used

### The Rules
(These can also be found
[here](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md)
):

Item Rules:
- Quality always between 0 and 50

The Gilded Rose, after updating the quality:
- SellIn lowers by 1
- Sulfuras:
	- does not change the quality
- Aged Brie:
	- Lets the quality always go up *(uncertainty by how much, see Questions)*
- BackStage:
	- Quality rises 2x if SellIn ≤ 10
	- Quality rises 3x if SellIn ≤ 5
	- Quality = 0 if SellIn < 0
- Other Item:
	- Quality decreases 1x if SellIn ≥ 0
	- Quality decreases 2x if SellIn < 0

### The Process
diagram?

The code came, and seemed to be functional, yet only one test has been provided with
it (`it does not change the name`). So, the first step has been to write tests for
each rule to create a sturdy foundation before tinkering in the code.

### Major Refactors

### Questions
- Currently, Brie seems to rise quality by 2 after each update. Is this the rule, or
  is it an error? *currently acting as if it should*


### Focus on Later
- Mock Item object in GildedRose tests
- Sulfuras: name includes instead of name equals
- downcase the name?

