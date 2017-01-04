# 1: Use ruby 2.3.3 as base:
FROM ruby:2.3.3-alpine

# 2: We'll add the app's binaries path to $PATH, and set the environment name to 'production':
ENV PATH=/usr/src/app/bin:$PATH

RUN adduser -u 9000 -D app


# 3: Install commands based on https://hub.docker.com/_/docker Dockerfiles:
RUN set -ex \
  && apk add --no-cache git \
  && apk add --no-cache --virtual .app-builddeps curl \
  && export DOCKER_BUCKET=get.docker.com \
  && export DOCKER_VERSION=1.12.3 \
  && export DOCKER_SHA256=626601deb41d9706ac98da23f673af6c0d4631c4d194a677a9a1a07d7219fa0f \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
  && apk del .app-builddeps


# 4: Copy just the Gemfile & Gemfile.lock, to avoid the build cache failing whenever any other
# file changed and installing dependencies all over again - a must if your'e developing this
# Dockerfile...
ADD ./whales_cli.gemspec* /usr/src/app/
ADD ./lib/whales_cli/version.rb /usr/src/app/lib/whales_cli/version.rb
ADD ./Gemfile* /usr/src/app/

# 5: Install build + runtime dependencies, install/build the app gems, and remove build deps:
RUN set -ex \
    && apk add --no-cache --virtual .app-rundeps icu-libs \
    && apk add --no-cache --virtual .app-builddeps build-base icu-dev cmake \
    && cd /usr/src/app \
    && bundle install --without development test \
    && apk del .app-builddeps

# 6: Copy the rest of the application code, then change the owner of the code to 'app':
ADD . /usr/src/app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/whales", "tame"]
