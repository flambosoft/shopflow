Dir[File.join(Rails.root, "db", "seed", "*.rb")].sort.each do |seed|
  load seed
end
