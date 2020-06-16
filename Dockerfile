FROM openjdk:8-jdk-buster

MAINTAINER Ladislav Petrus <ladislav_petrus@tempest.sk>

ADD https://sdkrepo.atlassian.com/deb-archive/atlassian-plugin-sdk_8.2.2_all.deb SDK.deb

RUN sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list' \
	&& wget -q https://packages.atlassian.com/api/gpg/key/public \
	&& apt-key add public \  
	&& dpkg -i SDK.deb

RUN mkdir /workdir
WORKDIR /workdir

CMD ["atlas-version"]