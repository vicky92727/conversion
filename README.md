## About Conversion API

Create a PHP API that has the following endpoints:
- POST to/invoices with the parameters START(string,date),END(string,date) and CUSTOMER_ID.The endpoint should calculate the invoice events,amount of events and total price. It will return the invoice_id.
- GET to/invoices/:id will return the details of the invoice. This includes:
a.A list of invoiced events
b.The frequence how often an event occurred in a period
c.The price for each event
d.The total price that the customer needs to pay
e.An additional list of users(ids or email addresses),what was invoiced for each user and why so that the customer can double-check if the invoice is correct..

## Installation

- After cloning the project please go to the project directory and run command (**composer install**).
- Create a database with any name like I used **conversion** and change the parameters in the .env file. like database name, username, host etc.
- After creating databse import the databse provided in db folder or if you want to create fresh installtion run the following command (**php artisan migrate:fresh --seed**), it'll create fresh db for you with dummy data in the users table, sessions table.
- now again go to terminal and run the command (**php artisan serve**) it'll give you an ip address with port like http://127.0.0.1:8000. 

## Postman

## Create Invoice

 open postnam and set parameter as
- URL : http://127.0.0.1:8000/api/invoices
- Method : POST
- Body : {
    "start_date" : "2021-03-01",
    "end_date" : "2021-05-01",
    "customer_id" : "1"
}

- You'll get the response like **{"invoice_id":1}**

## Get Invoice
- URL : http://127.0.0.1:8000/api/invoices/1
- Method : GET
- You'll get the response like **{"invoice_id":1}**
{
    "id": 1,
    "start_date": "2021-03-01 23:59:59",
    "end_date": "2021-05-01 23:59:59",
    "amount": "3.50",
    "customer_id": 1,
    "created_at": "2021-05-17T11:07:16.000000Z",
    "updated_at": "2021-05-17T11:07:16.000000Z",
    "events": [
        {
            "id": 1,
            "event_name": "appointment",
            "event_amount": "3.50",
            "occurence": 1,
            "user_id": 3,
            "invoice_id": 1,
            "created_at": "2021-05-17T11:07:16.000000Z",
            "updated_at": "2021-05-17T11:07:16.000000Z",
            "user": {
                "id": 3,
                "name": "Dr. Rahsaan Bode",
                "email": "elisha.wehner@example.org",
                "email_verified_at": "2021-05-16T11:39:34.000000Z",
                "customer_id": 1,
                "created_at": "2021-04-04T19:37:50.000000Z",
                "updated_at": "2021-05-16T11:39:34.000000Z"
            }
        }
    ]
}