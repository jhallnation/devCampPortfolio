10.times do |blog|
  Blog.create!(
    title: "testing #{blog}",
    body:  'This is just for fun'
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Wait! #{portfolio_item}",
    subtitle: 'ok',
    body: 'just some stuff',
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x250'
    )
end

puts '9 portfolio items created'