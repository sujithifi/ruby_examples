class RunningAverage

  def initialize(k)
    @k      = k
    @arr    = Array.new(k,0)
    @n      = 0
    @pos    = 0
    @tot    = 0.0
  end

  def avg(num)
    @tot       = @tot - @arr[@pos] + num
    @arr[@pos] = num
    @n        += 1
    @pos       = (@pos + 1 ) % @k
    @tot / ( @n > @k ? @k : @n )
  end

  alias_method :<<, :avg

end

  avg = RunningAverage.new(3)
p avg <<  5 #=> 5.0
p avg <<  6 #=> 5.5
p avg <<  9 #=> 6.666666666666667
p avg << 12 #=> 9.0
p avg <<  5 #=> 8.666666666666666
p avg <<  5 #=> 7.333333333333333
p avg <<  5 #=> 5.0
