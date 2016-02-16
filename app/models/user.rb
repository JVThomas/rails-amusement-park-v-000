class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    return nil if happiness.nil? || nausea.nil?
    return "sad" if happiness < nausea
    return "happy" if happiness > nausea
  end

end
