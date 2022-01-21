# MakersBNB5

We are creating a web app that allows users to list their BnB spaces for rent and to hire BnB spaces for the night.
----

# Setting up databases and tables

To set up the production database:
1. Create database named 'makersbnb'
2. Run query in 01_create_space_table.sql
3. Run query in 02_create_user_table.sql

To set up the test database:
1. Create database named 'makersbnb_test'
2. Run query in 01_create_space_table.sql
3. Run query in 02_create_user_table.sql
 
**User Specifications:**

* Any signed-up user can list a new space.
* Users can list multiple spaces. 
* Users should be able to name their space, provide a short description of the space, and a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night. 

Complete User Stories:
----

As a user 
So that I can list my rentals
I want to be able to add one at a time

As a user
So that I can list more than one property
I want to be able to add more than one property

As a user
So that I can market my property 
I want to be able to add a description (name, short description & price)

As a user
So that I can market my property on specific dates
I want to be able to list dates of availability

As a user
So that I can securely manage new space
I want to be able to log in to the BnB application


**Future User Stories:**
----

As a user 
So that I can book somewhere to stay
I want to be able to request a bnb space

As a user
So that I can control who stays 
I want to be able to approve the stay request

As a user
So that I don’t book a date that is already taken
I want to only see available stay dates 

As a user
So that I can maximise property occupancy
I want to the space to be available until I confirm it 


