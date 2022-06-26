FROM ruby:3.1.2

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    BUNDLE_PATH=vendor/bundle

WORKDIR /app

RUN echo "alias ll='ls -lG'" >> /root/.bashrc
RUN gem install bundler

# Dockerのビルドステップキャッシュを利用
# 先にGemfileを転送してbundle installする
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app

CMD ["bash"]