# Use an official base image, e.g., Ubuntu
FROM python:3.8.10

# Set maintainer label
LABEL maintainer="your.email@example.com"

# Clone htslib
RUN git clone --recurse-submodules https://github.com/samtools/htslib.git
RUN git clone https://github.com/samtools/bcftools.git

# Update and install system dependencies
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    zlib1g-dev \
    liblzma-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libhts-dev \
    git

# install bcftools
WORKDIR htslib
RUN make
WORKDIR ../bcftools
RUN make
WORKDIR ..

# setup paths
ENV BCFTOOLS_PLUGINS=/bcftools/plugins
ENV PATH="/usr/bin:/bcftools/:${PATH}"
ENV PATH="/usr/bin:/htslib/:${PATH}"

# install whatshap
RUN pip3 install whatshap

# copy plink
COPY plink2 /usr/local/bin/plink2

# get sam tools
RUN git clone https://github.com/samtools/samtools.git
WORKDIR samtools
RUN make
WORKDIR ..
ENV PATH="/usr/bin:/samtools/:${PATH}"


# get readtools
#WORKDIR ..
#RUN git clone https://github.com/frhl/readTools.git
#WORKDIR readTools
#RUN make 
#RUN chmod +x vcfPairFinder
#WORKDIR ..
#ENV PATH="/usr/bin:/readTools/:${PATH}"
#RUN echo ${PATH}

# Set default command to R when the container starts
CMD ["bash"]



