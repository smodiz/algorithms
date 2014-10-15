require_relative '../../lib/data_structures/binary_search_tree'

=begin

This test class is an RSpec conversion of the test class
for a bst in exercism.   

=end

describe BinarySearchTree do 

  it "retains the test data" do
    expect(BinarySearchTree.new(4).data).to eql 4
  end

  it "inserts a lesser item in the left node" do
    four = BinarySearchTree.new(4)
    four.insert(2)
    expect(four.data).to eql 4
    expect(four.left.data).to eql 2
  end

  it "inserts an equal item to the left" do
    four = BinarySearchTree.new(4)
    four.insert(4)
    expect(four.data).to eql 4
    expect(four.left.data).to eql 4    
  end

  it "inserts a greater item to the right" do
    four = BinarySearchTree.new(4)
    four.insert(5)
    expect(four.data).to eql 4
    expect(four.right.data).to eql 5
  end

  it "handles a complex tree correctly" do 
    four = BinarySearchTree.new(4)
    four.insert 2
    four.insert 6
    four.insert 1
    four.insert 3
    four.insert 7
    four.insert 5
    expect(four.data).to eql 4
    expect(four.left.data).to eql 2
    expect(four.left.left.data).to eql 1
    expect(four.left.right.data).to eql 3
    expect(four.right.data).to eql 6
    expect(four.right.left.data).to eql 5 
    expect(four.right.right.data).to eql 7
  end

  it "iterates over one element" do
    four = BinarySearchTree.new(4)
    expect(record_all_data(four)).to eql [4]
  end

  it "iterates properly after add smaller element" do
    four = BinarySearchTree.new(4)
    four.insert 2
    expect(record_all_data(four)).to eql [2, 4]
  end

  it "iterates properly after add larger element" do
    four = BinarySearchTree.new(4)
    four.insert 5
    expect(record_all_data(four)).to eql [4, 5]
  end

  it "iterates over complex tree properly" do
    four = BinarySearchTree.new(4)
    four.insert 2
    four.insert 1
    four.insert 3
    four.insert 6
    four.insert 7
    four.insert 5
    expect(record_all_data(four)).to eql [1, 2, 3, 4, 5, 6, 7]
  end

  def record_all_data(bst)
    all_data = []
    bst.each { |data| all_data << data }
    all_data
  end

end
