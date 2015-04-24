require 'benchmark'
require_relative 'dictionary_imple'
require_relative 'dictionary_imple_by_lists'
require_relative 'dictionary_imple_by_sorted_lists'

prep = -> (klass, loop_n) {
  dic = klass.new
  loop_n.times do |i|
    dic.add_kv_pair(i, i+1)
  end
  # puts "prep done"
  dic
}

measurer = -> (dic, lookup_n) {
  Benchmark.measure do
    lookup_n.times do |i|
      dic.get_val(i + 1)
    end
  end
}

{ native_hash:   MyDictionary,
  nested_list:   MyDictionaryByLists1,
  two_lists:     MyDictionaryByLists2,
  binary_search: MyDictionaryWithSortedList }.each do |label, imple_klass|
  [10,50,100,200,500,1000,2000,5000,10_000].each do |key_n|
    dic = prep.call(imple_klass, key_n)
    time = measurer.call(dic, 10_000)
    puts "#{label} with #{key_n} keys: #{time.real}"
  end
end
