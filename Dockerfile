FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu18.04

# Change default shell
RUN chsh -s /bin/bash
ENV SHELL=/bin/bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install usefull tools
RUN apt-get -qy update && apt-get install -qy \
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
    gettext-base \
    transmission-cli

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN apt-get -qy update && apt-get install -qy apt-utils
RUN apt-get install -qy software-properties-common && add-apt-repository ppa:c2d4u.team/c2d4u4.0+

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy tzdata keyboard-configuration

RUN add-apt-repository ppa:cran/libgit2
COPY apt-install-r-cran.sh /tmp/docker-apt-install-r-cran.sh
RUN bash /tmp/docker-apt-install-r-cran.sh

COPY apt-install-opencv.sh /tmp/docker-apt-install-opencv.sh
RUN bash /tmp/docker-apt-install-opencv.sh

COPY apt-install-misc.sh /tmp/docker-apt-install-misc.sh
RUN bash /tmp/docker-apt-install-misc.sh

COPY apt-install-cuda.sh /tmp/docker-apt-install-cuda.sh
RUN bash /tmp/docker-apt-install-cuda.sh


RUN apt-get install -qy git-lfs python3-pip


RUN apt-get -qq clean && rm -rf /var/lib/apt/lists/*


RUN python3.7 -m pip install --upgrade pip && python3.7 -m pip install setuptools==57.5.0

RUN python3.7 -m pip install "jax[cuda11_cudnn82]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
RUN python3.7 -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
RUN python3.7 -m pip install tensorflow==2.9.1 tensorboard==2.9.1

COPY requirements.txt /tmp/docker-requirements.txt
RUN python3.7 -m pip install -r /tmp/docker-requirements.txt

RUN CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal python3.7 -m pip install "gdal==2.2.2"

RUN python3.7 -m pip install convertdate lunarcalendar holidays "pystan==2.19.1.1" && python3.7 -m pip install "fbprophet==0.7.1"

RUN python3.7 -m spacy download en_core_web_sm


# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v12.20.1

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH







# Install Jupyter
RUN pip install pip==20.3.4 && \
    pip install jupyterlab==3.4.3 ipywidgets==7.7.1 && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter nbextension enable --py widgetsnbextension #enable ipywidgets

COPY jupyter.sh /usr/bin/jupyter.sh
RUN chmod 0755 /usr/bin/jupyter.sh

# Create a HOME dedicated to the ovhcloud user (42420:42420)
RUN mkdir -p /workspace && chown -R 42420:42420 /workspace
ENV HOME /workspace
WORKDIR /workspace


EXPOSE 8080

ENTRYPOINT []
CMD ["/usr/bin/jupyter.sh"]
