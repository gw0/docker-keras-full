# docker-debian-cuda - Debian 9 with CUDA Toolkit

FROM gw000/keras:1.0.4-gpu
MAINTAINER gw0 [http://gw.tnode.com/] <gw.2016@tnode.com>

# install py2-tf-cpu/gpu (Python2, TensorFlow, CPU/GPU)
# (already installed in upstream image)

# install py2-th-cpu (Python2, Theano, CPU/GPU)
ARG THEANO_VERSION=0.8.2
ENV THEANO_FLAGS='device=cpu,floatX=float32'
RUN pip --no-cache-dir install git+https://github.com/Theano/Theano.git@rel-${THEANO_VERSION}

# install py3-tf-cpu/gpu (Python2, TensorFlow, CPU/GPU)
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install python 3
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    pkg-config \
    # requirements for numpy
    libopenblas-base \
    python3-numpy \
    python3-scipy \
    # requirements for keras
    python3-h5py \
    python3-yaml \
    python3-pydot \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG TENSORFLOW_VERSION=0.8.0
ARG TENSORFLOW_DEVICE=cpu
#RUN pip3 --no-cache-dir install http://storage.googleapis.com/tensorflow/linux/${TENSORFLOW_DEVICE}/tensorflow-${TENSORFLOW_VERSION}-cp35-cp35m-linux_x86_64.whl
RUN pip3 --no-cache-dir install http://ci.tensorflow.org/view/Nightly/job/nightly-python35-linux-cpu/31/artifact/pip_test/whl/tensorflow-0.8.0-cp35-cp35m-linux_x86_64.whl

ARG KERAS_VERSION=1.0.4
ENV KERAS_BACKEND=tensorflow
RUN pip3 --no-cache-dir install git+https://github.com/fchollet/keras.git@${KERAS_VERSION}

# install py3-th-cpu/gpu (Python2, Theano, CPU/GPU)
ARG THEANO_VERSION=0.8.2
ENV THEANO_FLAGS='device=cpu,floatX=float32'
RUN pip3 --no-cache-dir install git+https://github.com/Theano/Theano.git@rel-${THEANO_VERSION}

# install jupyter ipython
RUN pip --no-cache-dir install \
    ipython \
    ipykernel \
    jupyter \
 && python -m ipykernel.kernelspec \
 && pip3 --no-cache-dir install \
    ipython \
    ipykernel \
 && python3 -m ipykernel.kernelspec

# dump package lists
RUN dpkg-query -l > /dpkg-query-l.txt \
 && pip2 freeze > /pip2-freeze.txt \
 && pip3 freeze > /pip3-freeze.txt

# for jupyter
EXPOSE 8888
# for tensorboard
EXPOSE 6006

WORKDIR /srv/
CMD /bin/bash -c 'jupyter notebook --no-browser --ip=* "$@"'
