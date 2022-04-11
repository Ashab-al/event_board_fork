# Event board for notification of events

# 1. Project objective

The goal of the project is to develop a platform for hosting conferences.
Authors can create their own events, closed and open. Participants can subscribe to events.
Authors and participants can write articles about the events they have subscribed to.
The application must be in 2 languages: Russian and English.

# 2. System description

The system consists of the following main functional blocks:

1. Registration, authentication and authorization
2. User functionality
3. Functionality of the event author
4. Functionality of the author of article events
5. Subscriber functionality
6. Admin functionality

[Technical Requirements](./docs/technical_requirements.md)

# 3. Schema

![schema](https://i.imgur.com/lJvPSmA.png)

# 4 Proposed technology stack:

* Bakcend:
  - Ruby 2.7.2
  - Ruby on rails 6.0.2
  - PostgreSQL db
  - Devise for registration and authentication
  - Pudnit for authorization
  - i18n for app multitranslate
  - puma server
  - activestorage

* Fronted
  - native javascript
  - tailwindcss

# 5 Installation

### System dependencies

`ruby '2.7.2'`

`gem 'rails', '~> 6.0.2'`

`database: postgresql`

### Configuration

`git clone https://github.com/allenonrails/event_board/`

`bundle install`

### Empty database

`rails db:drop db:create db:migrate`

###  database with sample data

`rails db:drop db:create db:migrate db:seed`

### Run the app

`bin/dev`
