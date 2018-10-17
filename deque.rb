require './empty_error'

# Author: Roman Schmidt, Daniel Osterholz
#
# This class uses an array to handle it like a Deque.
# Remove functions will raise an EmptyError.
class Deque

  private

  # Make sure there is an initialized array container
  def initialize
    @container = [];
  end

  public

  # If it is a valid element, it will be set as the first new element of an array and return true. All further elements
  # will be moved down in order.
  # If the element is not valid, it will return a false.
  def push_first(element)
    if check_element(element)
      @container.unshift(element)
      return true
    end
    false
  end

  # If there is an element to remove it will drop the first element and return a nil. Otherwise it will raise
  # an EmptyError
  def remove_first
    check_empty
    @container.shift
    nil
  end

  # Returns first element of the Deque or nil if nothing is set.
  def first
    @container[0]
  end

  # If it is a valid element, it will be append as the last new element of an array and return true.
  # If the element is not valid, it will return a false.
  def push_last(element)
    if check_element(element)
      @container.push(element)
      return true
    end
    false
  end

  # If there is an element to remove it will drop the first element and return a nil. Otherwise it will raise
  # an EmptyError
  def remove_last
    check_empty
    @container.pop
    nil
  end

  # Returns the last element of the Deque or nil if nothing is set.
  def last
    @container[@container.length - 1]
  end

  # Returns true if the Deque is empty or true if any elements are set.
  def empty?
    @container.empty?
  end

  private

  # Returns a boolean if the element is valid or not.
  def check_element(element)
    nil != element
  end

  # Raises an EmptyError if the container is empty.
  def check_empty
    if empty?
      raise EmptyError
    end
  end
end