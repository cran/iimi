% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_bam_to_rle.R
\name{convert_bam_to_rle}
\alias{convert_bam_to_rle}
\title{convert_bam_to_rle}
\usage{
convert_bam_to_rle(bam_file, paired = FALSE)
}
\arguments{
\item{bam_file}{path to BAM file(s).}

\item{paired}{Indicate if the sequencing paired is single-end or paired-end
reads. \code{TRUE} if paired-end. \code{FALSE} if single-end.}
}
\value{
A list of coverage profile(s) in RLE format with one or more samples.
}
\description{
Converts one or more indexed and sorted BAM files into a run-
length encodings (RLEs) list.
}
\examples{
\dontrun{
## Please change the path to your folder where you
## store sorted and indexed BAM files of mapped samples

rles <- convert_bam_to_rle("path/to/bam/file")
}

}
