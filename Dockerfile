FROM ruby:3.1.6-alpine3.20

# Install dependencies
RUN apk add --no-cache build-base postgresql-dev

# Set the working directory
WORKDIR /app

# Copy the local pgsync code to the container
COPY . /app

# Install the local pgsync code
RUN gem build pgsync.gemspec && gem install pgsync-*.gem

# Set the entrypoint to run pgsync
ENTRYPOINT ["pgsync"]