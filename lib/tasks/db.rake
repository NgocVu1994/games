namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating users"
    Fabricate :user, email: "admin@gmail.com", is_admin: 1

    puts "Creating games"
      name = Faker::Lorem.sentence(3)
      description = Faker::Lorem.paragraph
      Fabricate :game, name: name, description: description, image: File.open(File.join(Rails.root,
        "app/assets/images/11.png"))

      name = Faker::Lorem.sentence(3)
      description = Faker::Lorem.paragraph
      Fabricate :game, name: name, description: description, image: File.open(File.join(Rails.root,
        "app/assets/images/12.jpg"))

      name = Faker::Lorem.sentence(3)
      description = Faker::Lorem.paragraph
      Fabricate :game, name: name, description: description, image: File.open(File.join(Rails.root,
        "app/assets/images/13.jpg"))

      name = Faker::Lorem.sentence(3)
      description = Faker::Lorem.paragraph
      Fabricate :game, name: name, description: description, image: File.open(File.join(Rails.root,
        "app/assets/images/14.jpg"))

      name = Faker::Lorem.sentence(3)
      description = Faker::Lorem.paragraph
      Fabricate :game, name: name, description: description, image: File.open(File.join(Rails.root,
        "app/assets/images/15.jpg"))

    puts "Creating version"
    4.times do
      name = Faker::Lorem.sentence(2)
      description = Faker::Lorem.paragraph
      Fabricate :version, name: name, description: description, game_id: Game.first.id
    end

    puts "Success remake data"
  end
end
