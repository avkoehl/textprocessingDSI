% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipeline.R
\name{pipeline}
\alias{pipeline}
\title{Text Processing Pipeline}
\usage{
pipeline(ipath, opath, delim, ncores, clean_commands, lemma = TRUE,
  split = "c", size = 50000, sparsity = 0.02, abundance = 0.98,
  verbose = FALSE)
}
\arguments{
\item{ipath}{A string specifying path to the raw text files containing the corpus.}

\item{opath}{A string specifying the path to put all the outputs in.}

\item{delim}{A number (1 or 0), 0 means files are concated as they are, 1 means to replace newlines with spaces 
and delimit each document with a newline.}

\item{ncores}{A number specifying the number of cores to use.}

\item{clean_commands}{A string containing the combined parameters for running the cleaning script, 
refer to clean_corpus and clean_file documentation.}

\item{lemma}{**optional** A boolean if true the corpus will be lemmatized.}

\item{split}{**optional** A character('c' or 'l', default='c') specifying if the corpus should be split by memory size or by line count.}

\item{size}{**optional** A number (default 50,000) specifying the line count or size in kilobytes to segment the corpus into.}

\item{sparsity}{**optional** A number (default = 0.02) determining the threshold for sparse words to get rid of,
refer to get_sparse documenation.}

\item{abundance}{**optional** A number (default = 0.98) determining the threshold for abundant words to get rid of,
refer to get_abundant documentation.}

\item{verbose}{**optional** A bool, if set to TRUE print to console more information.}
}
\value{
A string giving path to the cleaned corpus file, containing one document on each line.
}
\description{
A function that runs the full pipeline for cleaning a corpus and preparing it
to be topic modelled. Has several optional arguments and some mandatory arguments.
Designed to be the simplest way to process a corpus. If you want more control,
run the various pieces of the pipeline manually. The pipeline is essentially: \cr
1) combine the corpus into a single file (one document per line) and split the corpus into equal sized chunks \cr
2) clean those chunks in parallel \cr
3) lemma those chunks in parallel \cr
4) find and remove the 'sparse' and 'abundant' terms \cr
5) recombine the now cleaned corpus into a single file (one document per line) \cr
6) delete the intermediary directories that were created \cr
7) save the parameters used to clean in an info file in the opath \cr
}
\examples{
\dontrun{
pipeline("/corpus/", "/opath/", 1, 20, "-lnprsd --maintain-newlines", split="l", size=2000)
pipeline("/corpus/", "/opath/", 1, 20, "-lnprsd --maintain-newlines", split="c", size=200000)
pipeline("/corpus/", "/opath/", 1, 20, "-lnprsd --maintain-newlines",lemma=FALSE,sparsity=0.04)
}
}
