# docAlign
This repository contains code the docAlign pipeline, a Nextflow and Docker Version of MMSeq2 software tools for searching  and clustering huge protein and nucleotide sequence sets. 

## Description of the files:
- `docAlign.nf` - Nextflow pipeline implemeting the protein sequence search and alignment to a database
- `Dockerfile` - A docker file for building a docker image of the pipeline

## Bulding the docker image:
**Note**: Ensure you have docker installed and running on your machine. 
- Clone this repository: git clone https://github.com/Fredrick-Kakembo/docAlign.git`
- `cd docAlign`
- Build the Docker image: `docker build -t docAlign .`
This will create a docker image of the pipeline called docAlign that will contain all the required dependencies required to run the pipeline. These include; conda, git, wget, MMSeq2, Nextflow. 

## Basic Usage:
`nextflow run


`nextflow run pfolding.nf --sequence /home2/fekakembo/Nexflow/pdbbuild/QUERY.fasta --database ${PWD}/DB.fasta --outdir final`
