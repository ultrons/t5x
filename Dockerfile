 FROM python:3.8
 RUN  git clone https://github.com/ultrons/t5x.git -b profile-study /root/t5x
 RUN  pip install -U  -e  /root/t5x;
 RUN  pip install --upgrade flax==0.6.1
 RUN  pip install --upgrade orbax==0.0.15
 RUN  pip install chex==0.1.5
 RUN  pip install --upgrade "jax[tpu]==0.4.4" -f    https://storage.googleapis.com/jax-releases/libtpu_releases.html
 RUN apt-get install apt-transport-https ca-certificates gnupg
 RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
 RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
 RUN apt-get update &&  apt-get install google-cloud-cli
 WORKDIR /root/t5x
