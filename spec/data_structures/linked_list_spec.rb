require_relative '../../lib/data_structures/linked_list'

describe LinkedList do 

  let(:list) { LinkedList.new("hello") }

  it "is initialized with a starting value" do
    expect(list).to be_a LinkedList
  end

  context "when the list has one or more values in it" do
    before(:each) do
      list.append("world")
    end

    it "returns the last value in the list" do
      expect(list.last).to eq "world"
    end

    it "appends values to the end of the list" do
      list.append("cheerio")
      expect(list.last).to eq "cheerio"
    end

    it "prepends values to the beginning of the list" do
      list.prepend("well")
      expect(list.first).to eq "well"
    end

    it "inserts data at the given index"

    it "inserts data after the given value"

    it "returns the first value in the list" do
      expect(list.first).to eq "hello"
    end

    it "returns the value at the given index" do
      list.append("cheerio")
      expect(list.get(0)).to eq "hello"
      expect(list.get(1)).to eq "world"
      expect(list.get(2)).to eq "cheerio"
    end

    it "returns true if the list contains the given data"

    it "returns false if the list does not contain the given data"

    it "removes the first value in the list"

    it "removes the last value from the list"

    it "removes data at the given index" 

    it "removes the given value from the list"

    it "clears all the data from the list"

  end

  context "when the list is empty" do

    before(:each) do
      list.clear 
    end
    
    it "returns nil as the last object" do
      expect(list.last).to be_nil
    end

    it "appends values to the end of the list" 

    it "prepends values to the beginning of the list" 
    
    it "inserts data at the given index"

    it "inserts data after the given value"

    it "returns the first value in the list"

    it "returns the value at the given index"

    it "removes the first value in the list"

     it "returns true if the list contains the given data"

    it "returns false if the list does not contain the given data"

    it "removes the last value from the list"

    it "removes data at the given index" 

    it "removes the given value from the list"
    
    it "clears all the data from the list"

  end

  

  it "iterates through the elements of the list"

  it "clears all the data from the list"

end
