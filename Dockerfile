FROM ovhcom/ai-training-one-for-all:latest

RUN chsh -s /bin/bash
ENV SHELL=/bin/bash
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add -

RUN apt-get update && apt-get install -y \
    man \
    vim \
    nano \
    htop \
    curl \
    wget \
    rsync \
    ca-certificates \
    git \
    zip \
    procps \
    ssh \
    supervisor \
    gettext-base \
    autoconf \
    nasm \
    automake \
    libtool \
    cmake \
    libsm6 \
    libxext6 \
    libxrender-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    libsasl2-dev \
    libldap2-dev \
    && rm -rf /var/lib/apt/lists/*


COPY vscode.sh /usr/bin/vscode.sh
##### SETUP SUPERVISORD #########
COPY supervisor.conf /etc/supervisor/supervisor.conf

##### SETUP WORKSPACE ######
WORKDIR /workspace

ENTRYPOINT []
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisor.conf"]
