FROM continuumio/miniconda3:latest as base

RUN conda update --all
RUN conda install numpy jupyter -y
RUN conda install pandas scrapy -y
RUN pip install html2text
RUN conda install sqlalchemy -y
RUN apt-get update 
#RUN apt-get install -y python3-dev default-libmysqlclient-dev
RUN conda install mysqlclient -y
RUN conda install pymysql -y
RUN conda install scipy matplotlib scikit-learn keras tensorflow pyyaml hdf5 h5py -y
RUN conda install pillow 
RUN conda install imageio -y
RUN conda install -c conda-forge nltk_data pdpbox catboost -y
RUN conda install python-graphviz -y
RUN conda install -c anaconda pytables -y
RUN conda install -c conda-forge filelock -y
RUN conda install -c anaconda more-itertools -y
RUN apt-get install -y zip unzip
RUN conda install -c anaconda tensorflow-hub
RUN pip install bert-for-tf2
RUN pip install dynaconf
RUN pip install guppy3
RUN pip install flask Flask-Reuploaded