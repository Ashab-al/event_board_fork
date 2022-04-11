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

## 2.1 User roles

The system provides four types of users of the system:
* the author of the event
* the author of the event article
* the subscriber
* the registered user

## 2.2 Registration

The system does not assume a separate registration for:
the event author, the author of article event, the subscriber

Registration is common for all types of users.
For user registration, the following data must be transmitted:

* name - require
* email - require
* password - require

After sending the registration form, an account confirmation email arrives.
You need to click on the link in the email to confirm your account.

## 2.3 Authentication

Authentication of users is carried out by email and password. 
It is supposed to implement the password recovery functionality.

## 2.4 User functionality

The user is supposed to have a profile page.
On the profile page, the user can edit their data:

* name
* email
* description (about me) 
* avatar

The functionality of changing the password on the profile page is assumed.
Each authrized user can create events, leave comments on articles,
subscribe to all open and closed events, if he has a pincode.
Registered users can like articles.

When a user is deleted, all his events and articles are deleted (delete functionality has admin only).

## 2.5 Functionality of the event author

To create an event, you need to fill out a form with the following data:
* title
* address
* datetime
* pincode (not require)
* image (not require)
* description

The author cannot create an event whose date has expired.
If the event picture is not set, then the standard picture that was conceived in the application design is taken.
A closed event or one open to all users is determined by the presence of a pincode.
The PIN code does not imply validation for the complexity of the PIN code.
If there is a PIN code, the event is supposed to have access to viewing the event through the PIN code form.
If the PIN code is entered correctly, the data is recorded in cookies.

## 2.6 Functionality of the author of article events

To create an article event, you need to fill out a form with the following data:
* title
* existing event
* body (action text)
* image (not require)

The author of the article cannot write an article
if he is not subscribed to any event or is not the owner of any event created in the application.
If the artilce event picture is not set, then the standard picture that was conceived in the application design is taken.
Any type of user can comment on the article.
The article has varnishes that registered users can leave.

## 2.7 Subscriber functionality

The subscription button is located inside the event page.
Unregistered users see the form instead of the "subscribe" button.
Unregistered user need to fill in the following data:

* user_name
* user_email

The author of the event should not be signed.
A registered subscriber can unsubscribe from an event if his time has not expired.
You cannot create a subscription for an unregistered user if the mail is already registered on the site.

## 2.8 Admin functionality

A separate page with a login form is provided for the administrator.
Login takes place using email and password of the user with the "admin" role.
The admin has the following rights:

* delete any user
* delete any event
* delete any article

## 2.9 Email Notifications

Notification of a new subscriber is sent to the mail of the author of the event


# 3 Proposed technology stack:

* Bakcend:
  - Ruby 2.7
  - Ruby on rails 6
  - PostgreSQL db
  - Devise for registration and authentication
  - Pudnit for authorization
  - i18n for app multitranslate
  - puma server
  - activestorage

* Fronted
  - native javascript
  - tailwindcss

Files and images uploaded by the author must be
stored in S3-compatible yandex storage.

Gem sendgrid for email notifications.

Hosting heroku.

# 4. Design

Tailwind minimalism.
