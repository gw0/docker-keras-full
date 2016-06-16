docker-keras-full
=================

***docker-keras-full*** is a [*Docker*](http://www.docker.com/) image built from *Debian 9* (amd64) with a full reproducible deep learning research environment based on [*Keras*](http://keras.io/) and [*Jupyter*](http://jupyter.org/). It supports CPU and GPU processing with [*Theano*](http://deeplearning.net/software/theano/) and [*TensorFlow*](http://www.tensorflow.org/) backends. It features *Jupyter Notebook* with *Python 2 and 3* support and uses only Debian and Python packages (no manual installations).

Open source project:

- <i class="fa fa-fw fa-home"></i> home: <http://gw.tnode.com/docker/keras-full/>
- <i class="fa fa-fw fa-github-square"></i> github: <http://github.com/gw0/docker-keras-full/>
- <i class="fa fa-fw fa-laptop"></i> technology: *debian*, *keras*, *theano*, *tensorflow*, *openblas*, *cuda toolkit*, *python*, *numpy*, *h5py*, *matplotlib*, *jupyter*
- <i class="fa fa-fw fa-database"></i> docker hub: <http://hub.docker.com/r/gw000/keras-full/>


Usage
=====

Quick experiment from console IPython:

```bash
$ docker run -it --rm gw000/keras-full ipython
```

To start the Jupyter IPython web interface on `http://<ip>:8888/` and notebooks stored in `/srv/notebooks`:

```bash
$ docker run -d -p=6006:6006 -p=8888:8888 -v=/srv/notebooks:/srv gw000/keras-full
```

To utilize your GPUs this Docker image needs access to your `/dev/nvidia*` devices (see [docker-debian-cuda](http://gw.tnode.com/docker/debian-cuda/)), like:

```bash
$ docker run -d $(ls /dev/nvidia* | xargs -I{} echo '--device={}') -p=6006:6006 -p=8888:8888 -v=/srv/notebooks:/srv gw000/keras-full
```


Feedback
========

If you encounter any bugs or have feature requests, please file them in the [issue tracker](http://github.com/gw0/docker-keras-full/issues/) or even develop it yourself and submit a pull request over [GitHub](http://github.com/gw0/docker-keras-full/).


License
=======

Copyright &copy; 2016 *gw0* [<http://gw.tnode.com/>] &lt;<gw.2016@tnode.com>&gt;

This library is licensed under the [GNU Affero General Public License 3.0+](LICENSE_AGPL-3.0.txt) (AGPL-3.0+). Note that it is mandatory to make all modifications and complete source code of this library publicly available to any user.
