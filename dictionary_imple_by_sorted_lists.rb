class MyDictionaryWithSortedList
  Pair = Struct.new(:key, :value)
  def initialize
    @imple = []
  end

  def add_kv_pair(k, v)
    @imple << Pair.new(k,v)
    @imple.sort_by! {|pair| pair.key }
  end

  def get_val(k, target_list = @imple)
    middle_idx = target_list.length / 2.to_f

    # edge cases: iterating with same list
    # list[ 0..(2 / 2.0) ] always returns you length 2 list, thus infinite loop
    return nil if middle_idx < 1.0
    if middle_idx == 1.0 && target_list.length == 2
      return target_list.first.value if k == target_list.first.key
      return target_list.last.value if k == target_list.last.key
      return nil
    end
    return nil if target_list.empty?
    return target_list[ middle_idx ].value if k == target_list[ middle_idx ].key

    if -1 == (k <=> target_list[ middle_idx ].key)
      get_val(k, target_list[ 0..middle_idx ])
    else
      get_val(k, target_list[ middle_idx..-1 ])
    end
  end

  def remove_key(k)
  end
end

@dic = MyDictionaryWithSortedList.new
@dic.add_kv_pair('super', 'mario')
@dic.add_kv_pair('asuper', 'luige')
fail 'fail' if @dic.get_val('super') != 'mario'
puts 'good'
