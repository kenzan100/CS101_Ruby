class MyDictionary
  def initialize
    @imple = {}
  end

  def add_kv_pair(k, v)
    @imple[k] = v
  end

  def get_val(k)
    @imple[k]
  end

  def remove_key(k)
    @imple.delete k
  end
end

@dic = MyDictionary.new
@dic.add_kv_pair('super', 'mario')

if 'mario' == @dic.get_val('super')
  puts 'good'
else
  fail 'failed #1'
end
