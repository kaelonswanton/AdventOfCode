class FileType
  def self.to_array(file)
    File.read(file).split("\n")
  end
end

class Movement
  attr_reader :array

  def self.from_file(path)
    array = FileType.to_array(path)
    new(array)
  end

  def initialize(array)
    @array = array
  end

  def forward
    forward_movements = array.select { |movement| movement.include?('forward') }
    forward_movements.map { |movement| movement.split(' ').last.to_i }.sum
  end

  def horizontal
    forward
  end

  def up
    up_movements = array.select { |movement| movement.include?('up') }
    up_movements.map { |movement| movement.split(' ').last.to_i }.sum
  end

  def down
    down_movements = array.select { |movement| movement.include?('down') }
    down_movements.map { |movement| movement.split(' ').last.to_i }.sum
  end

  def depth
    down - up
  end

  def result
    depth * horizontal
  end
end
 
p Movement.from_file('file').result
