FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /abdapp
WORKDIR /abdapp
COPY Gemfile /abdapp/Gemfile
COPY Gemfile.lock /abdapp/Gemfile.lock
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install
COPY . /abdapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]






EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "bundle"]