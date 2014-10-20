require_relative '../../lib/data_structures/stack'

describe Stack do 

  let(:stack) { Stack.new }

  it "pushes and pops a single value on/off stack" do
    stack.push(5)
    expect(stack.pop).to eql 5
  end

  it "returns nil if pop is called on an empty stack" do
    expect(stack.pop).to be_nil
  end

  it "pushes and pops a multiple values on/off stack" do
    stack.push(5)
    stack.push(7)
    stack.push(2)
    stack.push(22)
    stack.push(19)
    expect(stack.pop).to eql 19
    expect(stack.pop).to eql 22
    expect(stack.pop).to eql 2
    expect(stack.pop).to eql 7
    expect(stack.pop).to eql 5
    expect(stack.pop).to be_nil
  end

  it "peeks at the top value without removing it" do
    stack.push(5)
    expect(stack.peek).to eql 5
    expect(stack.pop).to eql 5
  end

  it "peeks properly with multiple values in the stack" do
    stack.push(7)
    stack.push(5)
    expect(stack.peek).to eql 5
    expect(stack.pop).to eql 5
  end

  it "returns nil when peeking at an empty stack" do 
    expect(stack.peek).to be_nil
  end

  it "iterates through the items in the stack" do
    stack.push(5)
    stack.push(7)
    stack.push(2)
    stack.push(22)
    stack.push(19)
    items = []
    stack.each do |val|
      items << val
    end
    expect(items).to eql [19,22,2,7,5]
  end
end