FROM continuumio/miniconda3:latest

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
RUN conda install -c conda-forge nltk_data


