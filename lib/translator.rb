require 'yaml'
require 'pry'



def load_library(file_path)
  data = YAML.load_file(file_path)
  data.each do |hash|
    data[hash[0]] = {:english => hash[1][0], :japanese => hash[1][1]}
  end
  data
end


def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  data.each do |meaning,equivalent|
    equivalent.each do |language, emote|
      if emote == emoticon
        return equivalent[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  data = load_library(file_path)
  data.each do |meaning,equivalent|
    equivalent.each do |language, emote|
      if emote == emoticon
        return meaning
      end
    end
  end
  return "Sorry, that emoticon was not found"
end