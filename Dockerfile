FROM ubuntu

RUN apt-get update
RUN apt-get -y install curl  wget openssl openssh-server openssh-client git 

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
