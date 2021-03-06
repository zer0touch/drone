FROM ubuntu:14.04
Maintainer Ryan Harper <ryanharper007@zer0touch.co.uk>
RUN apt-get -qq update && \
    apt-get install wget curl git unzip -y

# Add all your Files
ADD http://downloads.drone.io/master/drone.deb /tmp/drone.deb
ADD https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip /consul.zip
ADD ./services/drone.json /etc/consul.d/drone.json
ADD ./run.sh /run.sh

# RUN the install
RUN unzip -d /usr/local/bin/ /consul.zip && \
    dpkg -i /tmp/drone.deb && \
    rm -f /tmp/*.deb && \
    rm -f /tmp/*.zip && \
    chmod 750 /run.sh

ADD ./drone.toml /etc/drone/drone.toml
VOLUME /consul-data
VOLUME /etc/consul.d

EXPOSE 3000
EXPOSE 22
CMD ["/run.sh"]
