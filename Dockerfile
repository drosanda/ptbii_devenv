FROM ubuntu:xenial-20210804
USER root
RUN echo "deb http://buaya.klas.or.id/ubuntu/ xenial main restricted universe multiverse \
deb http://buaya.klas.or.id/ubuntu/ xenial-updates main restricted universe multiverse \
deb http://buaya.klas.or.id/ubuntu/ xenial-security main restricted universe multiverse \
deb http://buaya.klas.or.id/ubuntu/ xenial-backports main restricted universe multiverse \
deb http://buaya.klas.or.id/ubuntu/ xenial-proposed main restricted universe multiverse" \
> /etc/apt/sources.list.d/buaya-klas.list \
  && DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  readline-common mysql-client-5.7 mysql-client-core-5.7 \
  locales build-essential sudo git nano curl software-properties-common \
  && locale-gen en_US.UTF-8 \
  && LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 71DAEAAB4AD4CAB6 \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
  && DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apache2 php7.0 php7.0-common php7.0-cli \
  php7.0-mcrypt php7.0-readline php7.0-curl php7.0-mysql php7.0-sqlite3 php7.0-tidy \
  php7.0-zip php7.0-gd php7.0-bcmath php7.0-cgi libapache2-mod-php7.0 php7.0-json \
  php7.0-mbstring php7.0-xml php7.0-xsl php7.0-intl \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load \
#   && ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load \
#   && /etc/init.d/apache2 restart
