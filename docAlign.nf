#!/usr/bin/env nextflow

/*
 * Program Description:
 * This Nextflow pipeline takes in a multifasta Protein sequence then uses it 
 *  to search and cluster huge protein and nucleotide sequence sets using the MMseq2 software suite
 */

params.sequence = "$baseDir/QUERY.fasta"
params.database = "$baseDir/DB.fasta"
params.outdir = "results"

workflow {
	mmseq_align(params.sequence, params.database)
}

process mmseq_align {
	tag "MSA with MMseq2"
	publishDir params.outdir 

	input:
	path sequence
	path database

	output:
	path "alnRes.m8"

	script:
	"""
	mmseqs easy-search $sequence $database alnRes.m8  tmp
	"""
}
