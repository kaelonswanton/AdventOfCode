class Movement
  def self.from_file(path)
    new(File.readlines(path))
  end

  def initialize(lines)
    @lines = lines
  end

  def call
    depth * horizontal
  end

  private

  def depth
    down - up
  end

  def forward
    movement_for('forward')
  end

  def up
    movement_for('up')
  end

  def down
    movement_for('down')
  end

  def depth
    down - up
  end

  def horizontal
    forward
  end

  def movement_for(direction)
    @lines
      .select { |line| line.include?(direction) }
      .map { |movement| movement.split(' ').last.to_i}
      .sum
  end

end

p Movement.from_file('file').call