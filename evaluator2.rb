# Get the total amount of images in a folder and assign to size_limit
system("cd images; ls | wc -l > count.txt")

file_count = File.read("images/count.txt").strip.to_i
size_limit = file_count - 2

size_limit.times do

# Standard image evaluation process.
require 'naive_bayes'

a = NaiveBayes.load('data/baysian/images.nb') 

## Read in images for evaluating statistics.
myself = File.read("data/images/myself.txt")
mary   =   File.read("data/images/mary.txt")
john   =   File.read("data/images/john.txt")
holly  =  File.read("data/images/holly.txt")
cora   =   File.read("data/images/cora.txt")

number = File.read("data/number/input.txt").strip.to_i

if number > 4
  number = 0
end

image_list = [
  myself, mary,
  john, holly,
  cora
]

active_image = image_list[number]
b            = active_image

# It's as if we were never apart
print a.classify(*b)
print ", "

open("data/number/input.txt", "w") { |f|
  f.puts number = number + 1
}

end

puts " "
