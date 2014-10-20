class Stack
  include Enumerable

  Node = Struct.new(:value, :next)

  def initialize
    @head = nil
  end

  def push(value)
    if @head
      new_node = Node.new(value, @head)
      @head = new_node
    else
      @head = Node.new(value)
    end
  end

  def pop
    if @head
      value = @head.value
      @head = @head.next
    end
    value
  end

  def peek
    @head.value if @head
  end

  def each
    node = @head
    while node
      yield node.value
      node = node.next
    end
  end

end
