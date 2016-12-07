FROM python:2.7
MAINTAINER Richard Challis/LepBase contact@lepbase.org

WORKDIR /
RUN git clone git://github.com/glennhickey/progressiveCactus.git
WORKDIR progressiveCactus
RUN git pull
RUN git submodule update --init
RUN make

WORKDIR /data
ENV ALIGN align
ENV NSLOTS 32
ENV PATH /progressiveCactus/bin:$PATH
ENV PYTHON_EGG_CACHE /tmp/.python-eggs
CMD runProgressiveCactus.sh ./$ALIGN.txt ./$ALIGN ./$ALIGN/$ALIGN.hal --database kyoto_tycoon --maxThreads $NSLOTS
