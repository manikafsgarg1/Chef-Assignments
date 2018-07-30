nested_array = [1, [0, 1, 1], [0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 1], [0, 1], 0]
nested_count = 0
nested_array.each do |array|
  count = 0
  if array.class == Array
    array.each do |element|
      if element.class != Array
        if element == 1
          puts "Array #{nested_count + 1}.......Element #{count + 1}"
          break
        end
        count += 1
      end
    end
  elsif array == 1
    puts "Array #{nested_count + 1}.......Element #{count + 1}"
  end
  nested_count += 1
end
