# Read in the Rubygem.
require "naive_bayes"

# Create the labels for Naive Bayes
a = NaiveBayes.new(
  :myself,
  :mary,
  :john,
  :holly,
  :cora,
)

# Read in the desired filepath.
a.db_filepath = 'data/baysian/images.nb'

# Convert images to text
system("jp2a images/myself.jpeg > data/images/myself.txt")
system("jp2a images/mary.jpeg > data/images/mary.txt")
system("jp2a images/john.jpeg > data/images/john.txt")
system("jp2a images/holly.jpeg > data/images/holly.txt")
system("jp2a images/cora.jpeg > data/images/cora.txt")

# Read in images for model
myself = File.read("data/images/myself.txt")
mary   =   File.read("data/images/mary.txt")
john   =   File.read("data/images/john.txt")
holly  =  File.read("data/images/holly.txt")
cora   =   File.read("data/images/cora.txt")

# Train model on image data
a.train(:myself, myself, "Myself")
a.train(:mary, mary, "Mary")
a.train(:john, john, "John")
a.train(:holly, holly, "Holly")
a.train(:cora, cora, "Cora")

# Save your data.
a.save