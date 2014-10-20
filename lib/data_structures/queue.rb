class Queue
  include Enumerable

  Node = Struct.new(:value, :next)

  def initialize
    @first = nil
    @last = nil
  end

  def enque(value)
    new_node = Node.new(value)
    @last.next = new_node if @last
    @last = new_node
    @first ||= @last
  end

  def deque
    if @first
      value = @first.value
      @first = @first.next
    end
    value
  end

  def each
    node = @first
    while node
      yield node.value
      node = node.next
    end
  end
end
