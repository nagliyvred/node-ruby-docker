FROM ubuntu

ENV SASS_LIBSASS_PATH "/usr/local/lib/libsass"

RUN apt-get update
RUN apt-get -y install curl  wget openssl openssh-server openssh-client git build-essential

# install libsass
WORKDIR /usr/local/lib/
RUN git clone https://github.com/sass/sassc.git
RUN git clone https://github.com/sass/libsass.git

WORKDIR /usr/local/lib/sassc/
RUN git submodule update --init
RUN echo 'SASS_LIBSASS_PATH="/usr/local/lib/libsass"' >> /etc/environment
RUN make
RUN ln -s /usr/local/lib/sassc/bin/sassc /usr/local/bin/sassc

# install nodejs
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN npm install grunt-cli -g

# install rvm
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.5"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install sass --no-ri --no-rdoc"



