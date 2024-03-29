

# 3.times do |topic|
#   Topic.create!(
#     title: "Topic #{topic}"
#     )
# end

# 10.times do |blog|
#   Blog.create!(
#     title: "blogs #{blog}",
#     body:  'This is just for fun', 
#     topic_id: Topic.last.id,
#     status: 1
#   )
# end

puts '10 blogs posts created'

10.times do |sports_blog|
  SportsBlog.create!(
    title: "sports blogs #{sports_blog}",
    body:  'This is just for fun', 
    status: 1
  )
end

puts '10 sports blogs posts created'

# 5.times do |skill|
#   Skill.create!(
#     title: "Rails #{skill}",
#     percent_utilized: 15
#   )
# end

# puts '5 skills created'

# 5.times do |portfolio_item|
#   Portfolio.create!(
#     title: "Arches #{portfolio_item}",
#     subtitle: 'Ruby on Rails',
#     body: 'just some stuff',
#     main_image: 'https://via.placeholder.com/350x250',
#     thumb_image: 'https://via.placeholder.com/350x250',
#     work_type: 'Employee'
#     )
# end

# 5.times do |portfolio_item|
#   Portfolio.create!(
#     title: "Dolomites #{portfolio_item}",
#     subtitle: 'Angular',
#     body: 'just some stuff',
#     main_image: 'https://via.placeholder.com/600x400',
#     thumb_image: 'https://via.placeholder.com/350x250',
#     work_type: 'Freelance'
#     )
# end

# puts '9 portfolio items created'

# 3.times do |technology|
#   Portfolio.last.technologies.create!(
#     name: 'Technology #{technology}',
#     )
# end

puts '3 technologies created'