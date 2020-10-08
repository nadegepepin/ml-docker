FROM 763104351884.dkr.ecr.us-east-2.amazonaws.com/tensorflow-training:2.3.0-gpu-py37-cu102-ubuntu18.04 as base_gpu

RUN apt-get install -y zip unzip

RUN pip install jupyter
RUN pip install html2text
RUN pip install matplotlib
RUN pip install imageio
RUN pip install filelock
RUN pip install more-itertools
RUN pip install dynaconf
RUN pip install guppy3

FROM 763104351884.dkr.ecr.us-east-2.amazonaws.com/tensorflow-training:2.3.0-cpu-py37-ubuntu18.04 as base_cpu

RUN apt-get install -y zip unzip

RUN pip install jupyter
RUN pip install html2text
RUN pip install matplotlib
RUN pip install imageio
RUN pip install filelock
RUN pip install more-itertools
RUN pip install dynaconf
RUN pip install guppy3
