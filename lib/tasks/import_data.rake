
task load_data: :environment do
  require 'csv'

  file = "#{Rails.root.to_s}/lib/tasks/movies.csv"
  csv_text = File.read(file)

  csv = CSV.parse(csv_text, headers: true)

  csv.each_with_index do |row, idx|
    row = row.to_hash.transform_keys{ |key| key.to_s.downcase.gsub(' ', '_') }
    movie = Movie.new(row)
    movie.save

  end

  file = "#{Rails.root.to_s}/lib/tasks/reviews.csv"
  csv_text = File.read(file)

  csv = CSV.parse(csv_text, headers: true)

  csv.each_with_index do |row, idx|
    row = row.to_hash.transform_keys{ |key| key.to_s.downcase.gsub(' ', '_') }
    row['stars'] = row['stars'].to_i
    review = Review.new(row)
    review.save

  end
  puts "data has been loaded"
end