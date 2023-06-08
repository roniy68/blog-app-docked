# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users
ben = User.create(
  name: 'Ben',
  bio: 'Lee Eun-young, better known by her stage name Ben, is a South Korean singer and songwriter. She made her official debut in October 2012, with their first extended play 147.5. As of 2020 she released one studio album, five extended plays and fifteen singles',
  photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ben_at_'Bello'_concert_on_January_11%2C_2019_(2).jpg/440px-Ben_at_'Bello'_concert_on_January_11%2C_2019_(2).jpg"
)

iu = User.create(
  name: 'IU',
  bio: 'Lee Ji-eun, known professionally as IU, is a South Korean singer-songwriter and actress. She signed with Kakao M in 2007 as a trainee and debuted as a singer at the age of fifteen with her album Lost and Found. Her follow-up albums, Growing Up and IU...IM, brought her mainstream success, but it was through "Good Day", the lead single from her 2010 album Real, that she achieved national stardom. "Good Day" spent five consecutive weeks at the top position of South Korea\'s Gaon Digital Chart, a joint record along with Psy\'s "Gangnam Style".',
  photo: 'https://static.asiachan.com/IU.full.251579.jpg'
)

punch = User.create(
  name: 'Punch',
  bio: 'Bae Jin-young, better known by her stage name Punch, is a South Korean singer',
  photo: "https://i1.wp.com/static.wikia.nocookie.net/kpop/images/b/b5/Punch_We're_Breaking_Up_promo_photo_(1).png/revision/latest/scale-to-width-down/1200?cb=20210615234004"
)

# Posts
loving = Post.create(
  title: 'Ben - Love, ing',
  text: 'Love, ing is a song by South Korean singer Ben. It was released on February 28, 2017, by Magic Strawberry Sound as a digital single. The song was written by Park Ji-hee and composed by Park Geun-cheol.',
  author_id: ben.id
)

one_eighty_deg = Post.create(
  title: 'Ben - 180 Degree',
  text: '180 Degree is a song by South Korean singer Ben. It was released on October 16, 2017, by Magic Strawberry Sound as a digital single. The song was written by Park Ji-hee and composed by Park Geun-cheol.',
  author_id: ben.id
)

dream = Post.create(
  title: 'IU - Dream',
  text: 'Dream is a song by South Korean singer-songwriter IU. It was released on December 9, 2010, by LOEN Entertainment as the lead single from her third extended play, Real. The song was written by Kim Eana and composed by Lee Min-soo.',
  author_id: iu.id
)

good_day = Post.create(
  title: 'IU - Good Day',
  text: 'Good Day is a song by South Korean singer-songwriter IU. It was released on December 9, 2010, by LOEN Entertainment as the lead single from her third extended play, Real. The song was written by Kim Eana and composed by Lee Min-soo.',
  author_id: iu.id
)

we_breaking_up = Post.create(
  title: 'Punch - We\'re Breaking Up',
  text: 'We\'re Breaking Up is a song by South Korean singer Punch. It was released on June 16, 2021, by Woollim Entertainment as a digital single. The song was written by Punch and composed by Park Geun-cheol.',
  author_id: punch.id
)

stay_with_me = Post.create(
  title: 'Punch - Stay With Me',
  text: 'Stay with Me is a song by South Korean singer Punch. It was released on December 3, 2016, by CJ E&M as a digital single. The song was written by Punch and composed by Park Geun-cheol.',
  author_id: punch.id
)

# Likes
Like.create(
  [
    { user_id: ben.id, post_id: loving.id },
    { user_id: iu.id, post_id: loving.id },
    { user_id: punch.id, post_id: loving.id },
    { user_id: ben.id, post_id: one_eighty_deg.id },
    { user_id: iu.id, post_id: one_eighty_deg.id },
    { user_id: punch.id, post_id: one_eighty_deg.id },
    { user_id: ben.id, post_id: dream.id },
    { user_id: iu.id, post_id: dream.id },
    { user_id: punch.id, post_id: dream.id },
    { user_id: ben.id, post_id: good_day.id },
    { user_id: iu.id, post_id: good_day.id },
    { user_id: punch.id, post_id: good_day.id },
    { user_id: ben.id, post_id: we_breaking_up.id },
    { user_id: iu.id, post_id: we_breaking_up.id },
    { user_id: punch.id, post_id: we_breaking_up.id },
    { user_id: ben.id, post_id: stay_with_me.id },
    { user_id: iu.id, post_id: stay_with_me.id },
    { user_id: punch.id, post_id: stay_with_me.id }
  ]
)

# Comments
Comment.create(
  [
    { user_id: ben.id, post_id: dream.id, text: 'I love this song!' },
    { user_id: punch.id, post_id: dream.id, text: 'Me too!' },
    { user_id: iu.id, post_id: loving.id, text: 'I love this song!' },
    { user_id: punch.id, post_id: good_day.id, text: 'Me too!' },
    { user_id: iu.id, post_id: stay_with_me.id, text: 'I love this song!' },
    { user_id: ben.id, post_id: stay_with_me.id, text: 'Nice song!' }
  ]
)
