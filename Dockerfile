# Use official Ruby image as base
FROM ruby:3.2

# Install dependencies for sass-embedded
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    nodejs \
    npm \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy original Gemfile
COPY Gemfile* ./

# Set bundle config to use system libraries
RUN bundle config build.sassc --disable-march-tune-native

# Install Ruby gems with verbose output
RUN bundle install --verbose

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Set environment variable for Jekyll
ENV JEKYLL_ENV=development

# Default command to run Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]