# Trip Card Explorer API

Rails API that provides trip data.

## Setup

Install dependencies

bundle install

Create database

rails db:create
rails db:migrate
rails db:seed

Run server

rails s

API runs at

http://localhost:3000/api/v1/trips

## Running tests

rspec

## Endpoints

GET /api/v1/trips
GET /api/v1/trips/:id
POST /api/v1/trips

## Features

- search
- filter by rating
- sort
- pagination