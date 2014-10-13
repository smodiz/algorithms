require_relative '../../lib/data_structures/linked_list'

describe LinkedList do 

  let(:list) { LinkedList.new("hello") }

  it "is initialized with a starting value" do
    expect(list).to be_a LinkedList
  end

  context "when the list has one or more values, " do
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

    it "returns false when asked if the list is empty?" do
      expect(list).to_not be_empty
    end

    it "inserts data at the given index" do
      list.insert("there",1)
      expect(list.get(0)).to eq "hello"
      expect(list.get(1)).to eq "there"
      expect(list.get(2)).to eq "world"
    end

    it "returns the first value in the list" do
      expect(list.first).to eq "hello"
    end

    it "returns the value at the given index" do
      list.append("cheerio")
      expect(list.get(0)).to eq "hello"
      expect(list.get(1)).to eq "world"
      expect(list.get(2)).to eq "cheerio"
      expect(list.get(3)).to be_nil
      expect { list.get(-1) }.to raise_error(ArgumentError)
    end

    it "returns the index if the list contains the given data" do
      expect(list.contains?("world")).to eq 1
    end

    it "returns false if the list does not contain the given data" do
      expect(list.contains?("oh-no!")).to eq false
    end

    it "removes the first value in the list" do
      list.remove_first
      expect(list.first).to eq "world"
    end

    it "removes the last value from the list" do
      list.remove_last
      expect(list.last).to eq "hello"
    end

    it "removes data at the given index" do
      list.append("!!")
      list.remove(1)
      expect(list.get(0)).to eq "hello"
      expect(list.get(1)).to eq "!!"
    end

    it "clears all the data from the list" do
      list.clear
      expect(list).to be_empty
    end

    it "iterates though the items in the list" do
      list.each_with_index do |node, index| 
        expect(node.value).to eq list.get(index)
      end
    end

  end

  context "when the list is empty" do

    let(:empty_list) { LinkedList.new }
    
    it "returns nil as the last object" do
      expect(empty_list.last).to be_nil
    end

    it "appends values to the end of the list" do
      empty_list.append("hola")
      expect(empty_list.last).to eq "hola"
    end

    it "prepends values to the beginning of the list" do
      empty_list.prepend("well")
      expect(empty_list.first).to eq "well"
    end

    it "returns nil for the first value in the list" do
      expect(empty_list.first).to be_nil
    end

    it "returns nil at the given index" do
      expect(empty_list.get(0)).to be_nil
    end

    it "returns true when asked if the list is empty?" do
      expect(empty_list).to be_empty
    end

    it "returns false when asked if the list contains the given data" do
      expect(empty_list.contains?("hello")).to eq false
    end

    it "returns nil when aksed to remove the first value in the list" do
      expect(empty_list.remove_first).to be_nil
    end

    it "returns nil when aksed to remove the last value from the list" do
      expect(empty_list.remove_last).to be_nil
    end

    it "returns nil when aksed to remove data at the given index" do
      expect(empty_list.remove(1)).to be_nil
    end

    it "does nothing when asked to clear all the data from the list" do
      expect { empty_list.clear }.to_not raise_error
    end

  end

end
