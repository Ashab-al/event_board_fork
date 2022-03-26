users = [
  {
    name: 'Oleg',
    email: 'oleg@mail.ru',
    password: '123abc123',
    about: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, dolorum velit! Similique, sapiente cupiditate. Nesciunt atque praesentium, natus qui facere quam maiores accusantium facilis assumenda aut, enim deserunt ex deleniti!",
    password_confirmation: '123abc123'
  },
  {
    name: 'Admin',
    email: 'admin@mail.ru',
    password: '123abc123',
    about: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, dolorum velit! Similique, sapiente cupiditate. Nesciunt atque praesentium, natus qui facere quam maiores accusantium facilis assumenda aut, enim deserunt ex deleniti!",
    password_confirmation: '123abc123' 
  },
  {
    name: 'Igor',
    email: 'igot@mail.ru',
    password: '123abc123',
    about: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, dolorum velit! Similique, sapiente cupiditate. Nesciunt atque praesentium, natus qui facere quam maiores accusantium facilis assumenda aut, enim deserunt ex deleniti!",
    password_confirmation: '123abc123' 
  },
]

users.each { |user_hash| User.create(user_hash)}

events = [
  {
    title: 'Rails online conf',
    description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, dolorum velit! Similique, sapiente cupiditate. Nesciunt atque praesentium, natus qui facere quam maiores accusantium facilis assumenda aut, enim deserunt ex deleniti!',
    address: 'Minsk',
    datetime: DateTime.now + 10,
    user: User.first
  }
]

events.each { |events_hash| Event.create(events_hash)}

subscriptions = [
  {
    user: User.last,
    event: Event.first
  },
  {
    user_name: 'Alex',
    user_email: 'mys@mauil.ru',
    event: Event.first
  }
]

subscriptions.each { |subscriptions_hash| Subscription.create(subscriptions_hash)}

articles = [
  {
    title: 'This event was so cool!',
    body: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta, sint.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minus, aspernatur.',
    picture: 'https://tinypng.com/images/social/website.jpg',
    event: Event.first,
    user: Event.first.subscribers.first
  }
]

articles.each { |articles_hash| Article.create(articles_hash)}

comments = [
  {
    user: User.first,
    body: 'Hiiiiiiiiiiiiiiii',
    article: Article.first
  },
  {
    user_name: 'Alex',
    body: 'Anonym user',
    article: Article.first
  },
  {
    user: Article.first.user,
    body: 'Author comment',
    article: Article.first
  }
]

comments.each { |comments_hash| Comment.create(comments_hash)}
