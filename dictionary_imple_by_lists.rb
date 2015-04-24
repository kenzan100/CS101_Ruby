class MyDictionaryByLists1
  def initialize
    @imple = []
  end

  def add_kv_pair(k, v)
    @imple.delete_if {|key, _v| key == k }
    @imple << [k,v]
  end

  def get_val(k)
    # this is slow
    kv_pair = @imple.select {|key, _v| key == k }
    kv_pair.first[1] unless kv_pair.empty?

    # this one is a bit better
    # kv_pair_idx = @imple.index {|key, _v| key == k }
    # @imple[kv_pair_idx][1] if kv_pair_idx
  end

  def remove_key(k)
    @imple.delete_if {|key, _v| key == k }
  end
end

@dic_list1 = MyDictionaryByLists1.new
@dic_list1.add_kv_pair('super', 'mario')
@dic_list1.add_kv_pair('super', 'mario2')
@dic_list1.remove_key('super2')
fail 'fail' if @dic_list1.get_val('super') != 'mario2'
@dic_list1.remove_key('super')
fail 'test failed' if @dic_list1.get_val('super') != nil
puts 'good'

class MyDictionaryByLists2
  # this time, store keys in one array, and store values in another array.
  def initialize
    @imple_keys = []
    @imple_vals = []
  end

  def add_kv_pair(k, v)
    remove_key(k)
    if idx = find_idx(k)
      @imple_keys.insert idx, k
      @imple_vals.insert idx, v
    else
      @imple_keys << k
      @imple_vals << v
    end
  end

  def get_val(k)
    if idx = find_idx(k)
      @imple_vals[idx]
    end
  end

  def remove_key(k)
    if idx = find_idx(k)
      @imple_vals.delete_at idx
      @imple_keys.delete_at idx
    end
  end

  private

  def find_idx(k)
    @imple_keys.index(k)
  end
end

@dic_list2 = MyDictionaryByLists2.new
@dic_list2.add_kv_pair('super', 'mario')
@dic_list2.add_kv_pair('super', 'mario2')
@dic_list2.remove_key('super2')
fail 'fail' if @dic_list2.get_val('super') != 'mario2'
@dic_list2.remove_key('super')
fail 'test failed' if @dic_list2.get_val('super') != nil
puts 'good'
