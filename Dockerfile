FROM ubuntu

# Install environment
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "LANG=en_US.UTF-8" >> /etc/environment
RUN echo "NODE_ENV=development" >> /etc/environment
RUN more "/etc/environment"
#RUN locale-gen en_US en_US.UTF-8
#RUN dpkg-reconfigure locales

# Install dependencies
RUN apt-get update
RUN apt-get install --yes curl git

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v
RUN npm i -g nodemon yarn
RUN nodemon -v
RUN yarn -v
RUN whereis yarn

# Install Calendso
RUN git clone https://github.com/calendso/calendso.git
WORKDIR /calendso
RUN yarn install

# Cleanup
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

ADD entry.sh /calendso/entry.sh
ADD createUser.js createUser.js
ADD .env .env
RUN chmod 777 /calendso/entry.sh

CMD ["./entry.sh"]
