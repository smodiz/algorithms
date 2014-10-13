=begin 
  This is an exercide in implementing a Linked List in Ruby. I
  encapsulated the concept of a head Node that links to the 
  other nodes in this class so that I could add behavior, like 
  easily iterating though the nodes
=end

class LinkedList
  include Enumerable

  Node = Struct.new(:value, :next)

  def initialize(data = nil)
    @head = Node.new(data, nil) if data
  end

  def empty?
    head.nil?
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
    node = get_node(index)
    if node
      node.value
    else
      nil
    end
  end

  def contains?(target_value)
    each_with_index do |node, index|
      return index if node.value == target_value
    end
    false
  end

  def each
    node = head
    while node
      yield node
      node = node.next
    end
  end

  def append(data)
    new_node = Node.new(data, nil)
    if head
      last = last_node
      last.next = new_node
    else
      self.head = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data, head)
    self.head = new_node
  end

  def insert(data, index)
    #since its not doubly linked and we don't have access to
    #prev node, replace the data at index with new data and 
    #insert a new node with the orig data ahead of it
    node_at_index = get_node(index)
    new_node = Node.new(node_at_index.value, node_at_index.next)
    node_at_index.value = data
    node_at_index.next = new_node
  end

  def remove_first
    self.head = head.next if head
  end

  def remove_last
    return unless head
    self.head = nil unless head.next
    prev = head
    each do |node|
      prev = node if node.next
    end
    prev.next = nil  
  end

  def remove(index)
    return unless head
    node = get_node(index)
    next_node = node.next
    node.value = next_node.value
    node.next = next_node.next
    next_node.next = nil
  end

  def clear
    self.head = nil
  end

private
  attr_accessor :head

  def last_node
    node = head
    while node
      last_node = node
      node = node.next
    end
    last_node
  end  

  def get_node(index)
    raise ArgumentError if index < 0
    each_with_index do |node, i|
      return node if i == index
    end
    nil
  end

end