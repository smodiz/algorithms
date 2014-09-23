class LinkedList

  Node = Struct.new(:value, :next)

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def last
    if node = last_node
      node.value
    else
      nil
    end
  end  

  def first
    if head
      head.value
    else
      nil
    end
  end

  def get(index)

  end

  def append(data)
    new_node = Node.new(data, nil)
    last = last_node
    last.next = new_node
  end

  def prepend(data)
    new_node = Node.new(data, head)
    self.head = new_node
  end

  def clear
    self.head = nil
  end

private
  attr_accessor :head

  def last_node
    node = head
    ret_node = node
    until node.nil?
      ret_node = node
      node = node.next
    end
    ret_node
  end  

end