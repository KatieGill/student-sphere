namespace :example_task do
  desc 'Greeting message task'

  task greet_the_user: :environment do
    puts 'Hello User! Welcome to the rake World!'
  end

  task say_bye_to_user: :environment do
    puts 'Hello User! It is time to sign off now.'
  end
end
