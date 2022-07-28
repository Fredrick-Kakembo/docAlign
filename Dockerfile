# Build a docker image using the ubuntu base image
FROM ubuntu:22.04

# Install a few prerequisites: wget, git
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install miniconda: This is to enable install the dependency tools eg mmseq2
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Export conda to a path it can be activated from
ENV PATH=$CONDA_DIR/bin:$PATH

# Install the conda tools required: nextflow and mmseq2
RUN conda install  -c conda-forge -c bioconda mmseqs2 nextflow

# Clone the MMseq2 repository so as to obtain some test datasets to be used
#RUN git clone https://github.com/soedinglab/MMseqs2.git

# Copy over the nextflow script and dependency files to the docker environment
COPY . .

# Default command to run the nextflow pipeline
CMD ["nextflow", "run", "docAlign.nf"]
