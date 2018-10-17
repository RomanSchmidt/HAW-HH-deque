require 'test/unit'
require './deque'

class DequeTest < Test::Unit::TestCase

  private

  # Value examples to tests with.
  TEST_VALUES = [:a, :b, :c, :d, :e, :f]

  public

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @deque = Deque.new
  end

  # Make sure nil ist not possible to be add as first element
  def test_false_add_first_ele
    assert_false(@deque.push_first(nil))
  end

  # Make sure nil ist not possible to be add as last element
  def test_false_add_last_ele
    assert_false(@deque.push_last(nil))
  end

  # Make sure EmptyError is raised if deque is empty on remove_first
  def test_ex_remove_first_element
    assert_raise EmptyError do
      @deque.remove_first
    end
  end

  # Make sure EmptyError is raised if deque is empty on remove_last
  def test_ex_remove_last_element
    assert_raise EmptyError do
      @deque.remove_last
    end
  end

  # Make sure nil is returned on first when deque is empty. (first)
  def test_nil_get_first
    assert_nil(@deque.first)
  end

  # Make sure nil is returned on first when deque is empty. (last)
  def test_nil_get_last
    assert_nil(@deque.last)
  end

  # Make sure true is delivered in empty? if deque is empty.
  def test_true_empty
    assert_true(@deque.empty?)
  end

  # Fill deque successfully and make sure first is not dropping elements but remove does (remove_first)
  def test_succ_remove_first_ele
    TEST_VALUES.each do |element|
      assert_true(@deque.push_last(element))
    end
    assert_equal(TEST_VALUES[0], @deque.first)
    assert_equal(TEST_VALUES[0], @deque.first)
    assert_nil(@deque.remove_first)
    assert_equal(TEST_VALUES[1], @deque.first)
  end

  # Fill deque successfully and make sure first is not dropping elements but remove does (remove_last)
  def test_succ_remove_last_ele
    TEST_VALUES.each do |element|
      assert_true(@deque.push_last(element))
    end
    assert_equal(TEST_VALUES[-1], @deque.last)
    assert_equal(TEST_VALUES[-1], @deque.last)
    assert_nil(@deque.remove_last)
    assert_equal(TEST_VALUES[-2], @deque.last)
  end

  # Fill the deque successfully and make sure first delivers the last imported element. (first)
  def test_succ_add_get_first_ele
    assert_true(@deque.empty?)
    TEST_VALUES.each do |element|
      assert_true(@deque.push_first(element))
      assert_equal(element, @deque.first)
    end
    assert_false(@deque.empty?)
  end

  # Fill the deque successfully and make sure first delivers the last imported element. (last)
  def test_succ_add_get_last_ele
    assert_true(@deque.empty?)
    TEST_VALUES.each do |element|
      assert_true(@deque.push_last(element))
      assert_equal(element, @deque.last)
    end
    assert_false(@deque.empty?)
  end
end