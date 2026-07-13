FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

# Set working directory
WORKDIR /app

# Copy Gemfile first for caching
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy project
COPY . .

# Expose port
EXPOSE 3000

# Start server
CMD ["rails", "server", "-b", "0.0.0.0"]