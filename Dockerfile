FROM starefossen/ruby-node:2-8-stretch
RUN echo "nameserver 146.231.129.97" > /etc/resolv.conf && \
    apt-get update -qq && \
    apt-get install -y vim build-essential libpq-dev && \
    gem install bundler
RUN mkdir /project
COPY Gemfile Gemfile.lock /project/
WORKDIR /project
RUN bundle install
COPY . /project
