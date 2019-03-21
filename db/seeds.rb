# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Dog.delete_all

dave = User.create!({name: "David Wood", email: "woody@gmail.com"})
lynn = User.create!({name: "Aunt Lynn", email: "lynnHana@gmail.com"})

dogs = [
  {
    name: 'Bowie',
    description: 'Bowie dances when he walks',
    user_id: dave.id
  },
  {
    name: 'Brownie',
    description: 'Brownie only sits pretty',
    user_id: lynn.id
  },
  {
    name: 'Jax',
    description: '',
    user_id: dave.id

  },
  {
    name: 'Jiro',
    description: 'Jiro takes a long time to destroy his toys',
    user_id: lynn.id

  },
  {
    name: 'Pete',
    description: 'Pete has a best friend named Lua',
    user_id: dave.id

  },
  {
    name: 'Bijou',
    description: 'Bijou is the fluffiest of them all',
    user_id: lynn.id

  },
    {
    name: 'Britta',
    description: 'Britta has two different colored eyes',
    user_id: lynn.id

  },
  {
    name: 'Noodle',
    description: 'Noodle is an Instagram celebrity',
    user_id: dave.id

  },
  {
    name: 'Stella',
    description: 'Stella loves to dig',
    user_id: lynn.id

  },
  {
    name: 'Tonks',
    description: 'Tonks loves to run',
    user_id: dave.id

  },
]



dogs.each do |dog|
  dog = Dog.find_or_create_by(name: dog[:name], description: dog[:description], user_id: dog[:user_id])
  directory_name = File.join(Rails.root, 'db', 'seed', "#{dog[:name].downcase}", "*")

  Dir.glob(directory_name).each do |filename|
    if !dog.images.any?{|i| i.filename == filename}
      dog.images.attach(io: File.open(filename), filename: filename.split("/").pop)
      sleep 1
    end
  end
end
