# Use an official base image, e.g., Ubuntu
FROM rocker/tidyverse:4.3.1

# Set maintainer label
LABEL maintainer="your.email@example.com"

# Install R packages
RUN R -e "install.packages('argparse', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggrepel', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('R.utils', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggsci', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggrastr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggforce', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('latex2exp', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('RColorBrewer', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Hmisc', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('googlesheets4', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('reshape2', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggsci', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('survival', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggsurvfit', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('broom', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggpubr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('digest', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('parallel', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('doParallel', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('limma', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('bit64', repos='http://cran.rstudio.com/')"

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Copy your application files
COPY . /app

# Set the working directory
WORKDIR /app

# Install the Python package in editable mode
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install dxpy

# Set default command to R when the container starts
#CMD ["R"]


