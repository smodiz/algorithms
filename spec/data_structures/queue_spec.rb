require_relative '../../lib/data_structures/queue'

describe Queue do 

  let(:queue) { Queue.new }

  it "enques and deques a single item" do
    queue.enque 5
    expect(queue.deque).to eql 5
  end

  it "returns nil when deque called on an empty queue" do
    expect(queue.deque).to be_nil
  end

  it "enques and deques multiple items correctly" do
    queue.enque 5
    queue.enque 7
    queue.enque 22
    queue.enque 3
    queue.enque 199
    expect(queue.deque).to eql 5
    expect(queue.deque).to eql 7
    expect(queue.deque).to eql 22
    expect(queue.deque).to eql 3
    expect(queue.deque).to eql 199
  end

  it "iterates through the items in the queue" do
    queue.enque 5
    queue.enque 7
    queue.enque 22
    queue.enque 3
    queue.enque 199
    items = []
    queue.each do |val|
      items << val
    end
    expect(items).to eql [5,7,22,3,199]
  end

end