# docAlign
This repository contains code of the docAlign pipeline, a Nextflow and Docker Version of MMSeq2 software tools for searching  and clustering huge protein and nucleotide sequence sets. 

## Description of the files:
- `docAlign.nf` - Nextflow pipeline implemeting the protein sequence search and alignment to a database
- `Dockerfile` - A docker file for building a docker image of the pipeline

## Bulding the docker image:
**Note**: Ensure you have docker installed and running on your machine. 
- Clone this repository: `git clone https://github.com/Fredrick-Kakembo/docAlign.git`
- `cd docAlign`
- Build the Docker image: `docker build -t docAlign .`    

This will create a docker image of the pipeline called docAlign that will contain all the required dependencies required to run the pipeline. These include; conda, git, wget, MMSeq2, Nextflow. 

Test your docker image: `docker run dockAlign`
This will run the MMSeq2 search tool using the example sequence data provided along with the pipeline.

## Usage:
```
nextflow run docAlign.nf \
    --sequences /path/to/protein/sequences \
    --databases /path/to/database \
    --outdir <output Directory> \
    -with-docker docAlign
```

The `--outdir` option is optional. Default is `results`. It specifies the output directory. Also the path to the sequences and databases should be an absolute path, or specifying the `${PWD}` before your inputs. 

## Example Run
```
nextflow run docAlign.nf \
    --sequence ${PWD}/QUERY.fasta \
    --database ${PWD}/DB.fasta 
    --outdir Example 
    -with-docker docAlign
```
