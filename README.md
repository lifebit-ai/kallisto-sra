# Kallisto Nextflow pipeline

A Nextflow implementation of Kallisto RNA-Seq Tools fetching samples directly from SRA

[![nextflow](https://img.shields.io/badge/nextflow-%E2%89%A50.24.0-brightgreen.svg)](http://nextflow.io)

## Quick start 

Make sure you have all the required dependencies listed in the last section.

Install the Nextflow runtime by running the following command:

    $ curl -fsSL get.nextflow.io | bash


When done, you can launch the pipeline execution by entering the command shown below:

    $ nextflow run lifebit-ai/kallisto-sra
    

By default the pipeline is executed against the provided example dataset. 
Check the *Pipeline parameters*  section below to see how enter your data on the program 
command line.     
    


## Pipeline parameters

#### `--accession` 
   
* Specifies identifier of a sample or a project accession number found in SRA database.
* Accession of a single sample can also be provided
* Accession numbers must be found in SRA DB, like SRR, SRX, PRJ, ...
* Involved in the task: fetch_sra and fastq-download.

Example: 

    $ nextflow run cbcrg/kallisto-nf --accession 'XXX'

This will connect to SRA DB and fetch all information related to the sample and/or project, which will be used to download automatically all sample fastq files in parallel.

Once the reads are fetched it will start quantification of each sample in parallel against the transcriptome provided.

The accession number may be specified as below for a single sample from SRA:

    $ nextflow run lifebit-ai/kallisto-sra --reads 'SRR925734'    


Or be specified as a project ID accession:

    $ nextflow run lifebit-ai/kallisto-sra --reads 'PRJNA210428'    
  
#### `--transcriptome`

* The location of the transcriptome multi-fasta file.
* It should end in `.fa`
* Involved in the task: kallisto-index.
* By default it is set to the Kallisto-NF's localization: `./tutorial/data/transcriptome/trascriptome.fa`

Example:

    $ nextflow run cbcrg/kallisto-nf --transcriptome /home/user/my_transcriptome/example.fa

#### `--fragment_len`

* Specifies the average fragment length of the RNA-Seq library.
* This is required for mapping single-ended reads.
* Involved in the task: kallisto-mapping.
* By default is set 180. 

Example: 

    $ nextflow run cbcrg/kallisto-nf --fragment_len 180


#### `--fragment_sd`

* Specifies the standard deviation of the fragment length in the RNA-Seq library.
* This is required for mapping single-ended reads.
* Involved in the task: kallisto-mapping.
* By default this is set 20.  

Example: 

    $ nextflow run cbcrg/kallisto-nf --fragment_sd 180


#### `--bootstrap` 

* Specifies the number of bootstrap samples for quantification of abundances.
* Involved in the task: kallisto-mapping.
* By default this is set 100. 

Example: 

    $ nextflow run cbcrg/kallisto-nf --bootstrap 100


#### `--output` 
   
* Specifies the folder where the results will be stored for the user.  
* It does not matter if the folder does not exist.
* By default is set to Kallisto-NF's folder: `./results` 

Example: 

    $ nextflow run cbcrg/kallisto-nf --output /home/user/my_results 
  

To lean more about the avaible settings and the configuration file read the 
[Nextflow documentation](http://www.nextflow.io/docs/latest/config.html).
  
  
Dependencies 
------------

 * [Nextflow](http://nextflow.io) (0.24.0 or higher)
 * [Docker](https://docker.com) (alternatively you will need to install the software packages listed [here](Dockerfile))  
