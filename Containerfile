FROM docker.io/library/debian:stretch

RUN apt -y update && apt -y install apt-utils gnupg wget

# Install mongodb 3
# https://www.mongodb.com/docs/v3.6/tutorial/install-mongodb-on-debian/
RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add - \
	&& echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" > /etc/apt/sources.list.d/mongodb-org-3.6.list \
	&& apt update

# Install UniFi Network Application
# https://www.ui.com/download-software/
RUN wget --quiet https://fw-download.ubnt.com/data/unifi-controller/c5c4-debian-7.1.66-cedd5b0507b34711b04b54f79c48dba8.deb \
	&& apt -y install ./c5c4-debian-7.1.66-cedd5b0507b34711b04b54f79c48dba8.deb
