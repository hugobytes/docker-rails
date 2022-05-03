FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.3.11
RUN bundle install

COPY . .

ENTRYPOINT [ "./entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]