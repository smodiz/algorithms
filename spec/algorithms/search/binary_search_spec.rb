require_relative '../../../lib/algorithms/search/binary_search'
require_relative '../../../lib/algorithms/search/binary_search_recursive'

[BinarySearch, BinarySearchRecursive].each do |klass|
  describe klass do 

    let(:tiny_list) { [0] }
    let(:small_list) { [0,1] }
    let(:large_even_list) { [3, 4, 7, 9, 23, 55, 87, 99] }
    let(:large_odd_list) { [3, 4, 7, 9, 23, 55, 87] }
    let(:unsorted_list) { [5, 3, 4] }

    it "returns the list" do
      b = BinarySearch.new(large_even_list)
      expect(b.list).to equal large_even_list
    end

    it "returns the middle" do
      b = BinarySearch.new(tiny_list)
      expect(b.middle).to eq 0
      b = BinarySearch.new(small_list)
      expect(b.middle).to eq 1
      b = BinarySearch.new(large_even_list)
      expect(b.middle).to eq 4
      b = BinarySearch.new(large_odd_list)
      expect(b.middle).to eq 3
    end

    it "raises an error for an unsorted list" do
      expect { BinarySearch.new(unsorted_list) }.to raise_error 
    end

    it "raises an error for an item not in the list" do
      b = BinarySearch.new(large_odd_list)
      expect { b.search_for(10) }.to raise_error 
      expect { b.search_for(1) }.to raise_error 
      expect { b.search_for(100) }.to raise_error 
    end

    it "finds the item in a large list" do
      b = BinarySearch.new(large_odd_list)
      expect(b.search_for(3)).to eq 0
      expect(b.search_for(7)).to eq 2
      expect(b.search_for(55)).to eq 5
      expect(b.search_for(87)).to eq 6
    end

    it "finds the item in a large list" do
      b = BinarySearch.new(large_even_list)
      expect(b.search_for(3)).to eq 0
      expect(b.search_for(7)).to eq 2
      expect(b.search_for(55)).to eq 5
      expect(b.search_for(99)).to eq 7
    end
  end
end