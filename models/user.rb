class User
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end

  def self.create(type, name)
    new(type, name)
  end
end