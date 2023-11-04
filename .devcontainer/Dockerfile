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
	apt-get autoremove -y && apt-get clean all

# Install Python.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	python3 python3-pip python3-full python3-all-dev python3-gevent \
	libnss3 libnspr4 libglib2.0-0 libdbus-1-dev xdg-utils libgbm1 \
	libasound2 fonts-liberation xvfb fonts-liberation && \
	apt-get autoremove -y && apt-get clean all

# Create some soft links.
RUN cd /usr/bin && \
        ln -sf python3 python && \
        ln -sf python3-config python-config

# Install Chrome Browser for performing headless tests.
ENV CHROME_VERSION="119.0.6045.105"
RUN apt-get update && \
	wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb && \
	apt-get install -y --no-install-recommends --no-install-suggests -f ./google-chrome-stable_${CHROME_VERSION}-1_amd64.deb && \
	rm -f google-chrome-stable_${CHROME_VERSION}-1_amd64.deb && apt-get autoremove -y && apt-get clean all

# Install chromedriver.
RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chromedriver-linux64.zip && \
	unzip chromedriver-linux64.zip && \
	mv chromedriver-linux64/chromedriver /usr/bin && \
	rm -rf chromedriver-linux64*

# Install firefox.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests firefox-esr && \
	apt-get autoremove -y && apt-get clean all

# Install geckodriver.
ENV GECHO_DRIVER_VERSION="0.33.0"
RUN wget https://github.com/mozilla/geckodriver/releases/download/v${GECHO_DRIVER_VERSION}/geckodriver-v${GECHO_DRIVER_VERSION}-linux64.tar.gz && \
	tar -xf geckodriver-v${GECHO_DRIVER_VERSION}-linux64.tar.gz -C /usr/bin/ && \
	rm -f geckodriver-v${GECHO_DRIVER_VERSION}-linux64.tar.gz

# Install MS Edge.
ENV EDGE_VERSION="118.0.2088.76"
RUN wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${EDGE_VERSION}-1_amd64.deb && \
	apt-get install -y --no-install-recommends --no-install-suggests -f ./microsoft-edge-stable_${EDGE_VERSION}-1_amd64.deb  && \
	rm -f microsoft-edge-stable_${EDGE_VERSION}-1_amd64.deb && \
	apt-get autoremove -y && apt-get clean all

# Install MS Edge Driver.
RUN wget https://msedgedriver.azureedge.net/${EDGE_VERSION}/edgedriver_linux64.zip && \
	unzip edgedriver_linux64.zip -d /usr/bin/ && \
	rm -f edgedriver_linux64.zip

# Create default user.
ENV USER_ID=1000
ENV USER_NAME=devuser
RUN addgroup --gid ${USER_ID} ${USER_NAME} && \
	adduser --disabled-password --gecos "" \
	    --uid ${USER_ID} --gid ${USER_ID} ${USER_NAME}

# Set default user.
ENV HOME /home/devuser
WORKDIR /home/devuser
USER devuser

# Install some libraries.
RUN pip install --break-system-packages \
	pipreqs==0.4.13 \
	pytest==7.4.3 \
	setuptools==68.2.2 \
	pyaml==23.9.7 \
	Pillow==10.1.0

# Install testify.
RUN pip install --break-system-packages testify==0.11.3

# Install behave.
RUN pip install --break-system-packages behave==1.2.6

# Install nose2.
RUN pip install --break-system-packages nose2==0.14.0

# Install selenium.
RUN pip install --break-system-packages selenium==4.15.1

# Install poetry.
RUN pip install --break-system-packages poetry==1.6.1

# Install robotframwork.
RUN pip install --break-system-packages \
	robotframework==6.1.1  \
	robotframework-datadriver==1.9.0 \
	robotframework-excellib==2.0.1 \
	robotframework-pythonlibcore==4.2.0 \
	robotframework-seleniumlibrary==6.1.3 \
	robotframework-requests==0.9.5 \
	robotframework-jsonlibrary==0.5 \
	robotframework-xvfb==1.2.2 \
	robotframework-pabot==2.16.0

# Install browser support.
RUN pip install --break-system-packages \
	webdriver-manager==4.0.1

# Print Version.
RUN python --version

# Update PATH.
ENV PATH=${PATH}:~/.local/bin/

CMD /bin/bash
