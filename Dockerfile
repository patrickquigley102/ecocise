FROM ruby:2.5.1

# apt based dependencies
RUN apt-get update -qq && apt-get install -y build-essential

# nokogiri dependencies
RUN apt-get install -y libxml2-dev libxslt1-dev

# JS runtime
RUN apt-get install -y nodejs

# main working directory
ENV APP_HOME /ecocise
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# install gem depencies
ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

# expose through a port
EXPOSE 3000

# start puma
CMD bundle exec rails server -b 0.0.0.0
