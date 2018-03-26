class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    self.limit(5)
  end

  def self.dinghy
    where("length <= 20")
  end

  def self.ship
    where("length >= 20")
  end

  def self.last_three_alphabetically
    self.order("name DESC").limit(3)
  end

  def self.without_a_captain
    where("captain_id is null")
  end

  def self.sailboats
    self.joins(:classifications).where("classifications.name == ?", "Sailboat")
  end

  def self.with_three_classifications
    self.joins(:classifications)
    .count("classifications.name")
    # .order("DESC")
  end

end
