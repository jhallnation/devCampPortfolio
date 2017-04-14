def frame arr
  long = arr.max_by(&:length)
  long.split(//).each do |i|
    puts i.gsub(/a-z/, '*')
  end
  arr.each do |x| 
    puts "*#{x}*"
  end
end
test = ['this', 'is', 'a', 'wicked', 'test']
frame(test)



# takes an array of strings or strings and puts a frame around it. exp. arr = ['hello', 'world', 'in', 'a', 'frame']

# *******
# *hello*
# *world*
# *in   *
# *a    *
# *frame*
# *******
# research .center