FROM debian:12.2

ENV DEBIAN_FRONTEND=noninteractive

# Perform an update.
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean all

# Install common utilities and tools.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	bash curl wget tar zip bzip2 xz-utils \
	unzip make ca-certificates gnupg \
	git git-core openssh-client vim && \
	apt-get clean all

# Install Python.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	python3 python3-pip python3-full python3-all-dev python3-gevent \
	libnss3 libnspr4 libglib2.0-0 && \
	apt-get clean all

# Create some soft links.
RUN cd /usr/bin && \
        ln -sf python3 python && \
        ln -sf python3-config python-config

# Create default user.
ENV USER_ID=1000
ENV USER_NAME=devuser
RUN addgroup --gid ${USER_ID} ${USER_NAME} && \
	adduser --disabled-password --gecos "" \
	    --uid ${USER_ID} --gid ${USER_ID} ${USER_NAME}

# Set default user.
ENV HOME /home/devuser
USER devuser

# Install some libraries.
RUN pip install --break-system-packages \
	pipreqs pytest setuptools pyaml

# Install testify.
RUN pip install --break-system-packages testify

# Install behave.
RUN pip install --break-system-packages behave

# Install nose2.
RUN pip install --break-system-packages nose2

# Install selenium.
RUN pip install --break-system-packages selenium

# Install poetry.
RUN pip install --break-system-packages poetry

# Install robotframwork.
RUN pip install --break-system-packages \
	robotframework robotframework-datadriver \
	robotframework-excellib robotframework-pythonlibcore \
	robotframework-seleniumlibrary

# Install browser support.
RUN pip install --break-system-packages \
	webdriver-manager

# Install chromedriver support.
RUN pip install --break-system-packages \
	chromedriver-binary

# Print Version.
RUN python --version

CMD /bin/bash
