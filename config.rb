require 'json'

class Config
  def initialize
    open("config.json") do |io|
      json = JSON.load(io)
      @mail = json["mail"]
      @pass = json["pass"]
    end
  end
  def pass
    return @pass
  end
  def mail
    return @mail
  end
end
