# README

## Introduction

This is a simple Rails app that runs an intergration test suite on the Bikes
application. The app uses Capybara and Firefox.

## Setup

### Install the mozilla geckodriver.

See https://github.com/mozilla/geckodriver/releases

### Install the Bikes (test-testers) application

Clone the repo from https://github.com/jujhars13/test-testers.

### Install Ecocise

Clone the repo from https://github.com/patrickquigley102/ecocise

## Run the Intergration Test Suite

First start the Bikes application.

Enter the test-testers directory

`docker run -it -v ${PWD}/app:/usr/share/nginx/html:ro -p 80:80 nginx:1.13`

Then start the rails server.

Enter the ecocise directory

'rails s'

Then issue a post request `curl 0.0.0.0:3000/test_results -X POST`.

Alternatively, locally you can.

Enter to project directory and run `rspec`.

This is a standard Rails application, see http://guides.rubyonrails.org/ for
more usage.
