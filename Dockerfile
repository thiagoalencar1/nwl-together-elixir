FROM elixir:1.12.0

# Install debian packages
RUN apt-get update
RUN apt-get install -y build-essential inotify-tools postgresql-client autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

# Install Phoenix packages
RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.5.8 \
  && mix local.rebar

WORKDIR /app
EXPOSE 4000
