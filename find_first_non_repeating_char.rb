class Find

  def initialize(str)
    @str = str
    @arr = []
    i    = -1
    @str.each_byte do |c|
      i+=1
      @arr[c.ord] ? @arr[c.ord][1] += 1 : @arr[c.ord] = [i, 1]
    end
  end

  def find
    index = Float::INFINITY
    @arr.each do |pos,count|
      next unless count
      index = pos if count == 1 && index > pos
    end
    index == Float::INFINITY ? nil : @str[index]
  end

end

p Find.new("baby").find  # => a
p Find.new("12323").find # => 1
p Find.new("baba").find  # => nil

