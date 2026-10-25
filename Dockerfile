# Start with a base image that includes Python
FROM python:3.8-slim

# Install system dependencies required by Hail
RUN apt-get update && apt-get install -y \
    openjdk-17-jre-headless \
    liblz4-dev \
    libopenblas-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables required for PySpark and Hail
ENV PYSPARK_PYTHON=python3
ENV HAIL_HOME=/opt/hail
ENV PATH=$PATH:$HAIL_HOME
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.9-src.zip:$PYTHONPATH

# Install Hail
RUN pip install hail

# Install any other Python essentials you need
# Example: NumPy, Pandas, etc.
RUN pip install numpy pandas

# The command that runs your application
CMD ["python"]

