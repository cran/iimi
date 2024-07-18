## ----warning=FALSE, message=FALSE, eval=FALSE---------------------------------
#  # install iimi
#  install.packages(c("iimi", "httr"))
#  
#  # install Biostrings
#  if (!require("BiocManager", quietly = TRUE))
#      install.packages("BiocManager")
#  
#  BiocManager::install("Biostrings")

## ----warning=FALSE, message=FALSE---------------------------------------------
library(iimi)

library(Biostrings)

library(httr)

## ----eval=FALSE, warning=FALSE------------------------------------------------
#  path_to_bamfiles <- list.files(
#    path = "path/to/your/BAM/files/folder",
#    pattern = "bam$",
#    full.names = TRUE,
#    include.dirs = TRUE
#  )

## ----eval=FALSE, warning=FALSE------------------------------------------------
#  example_cov <- convert_bam_to_rle(bam_file = "path_to_bamfiles")

## ----eval=FALSE, warning=FALSE------------------------------------------------
#  df <-
#    convert_rle_to_df(covs = example_cov, unreliable_region_df = unreliable_regions)

## ----message=FALSE, warning=FALSE, results='hide', eval=FALSE-----------------
#  prediction_default <- predict_iimi(newdata = df, method = "xgb")

## ----eval=FALSE---------------------------------------------------------------
#  # set seed
#  set.seed(123)
#  
#  # spliting into 80-20 train and test data set with the three plant samples
#  train_names <- sample(levels(as.factor(df$sample_id)),
#                        length(unique(df$sample_id)) * 0.8)
#  
#  # trian data
#  # train_x is the feature-extracted data frame of your train data
#  train_x = df[df$sample_id %in% train_names,]
#  
#  # train_y is the known truth or labels for your train_x data, indicating the presence of specific viruses in the samples
#  train_y = c()
#  
#  for (ii in 1:nrow(train_x)) {
#    train_y = append(train_y, example_diag[train_x$seg_id[ii],
#                                           train_x$sample_id[ii]])
#  }
#  
#  # test data
#  # test_x is the feature-extracted data frame of the data you would like to predict
#  # here we used the sample that is not in the training set for demonstration purpose
#  test_x = df[df$sample_id %in% train_names == F,]

## ----message=FALSE, warning=FALSE, results='hide', eval=FALSE-----------------
#  fit <- train_iimi(train_x = train_x, train_y = train_y)

## ----eval=FALSE---------------------------------------------------------------
#  prediction_customized <-
#    predict_iimi(newdata = test_x,
#                 trained_model = fit)

## ----eval=FALSE---------------------------------------------------------------
#  # if you would like to keep unmappable regions that can be mapped to other viruses or the host genome separate into two data frames, you may use the following code:
#  
#  # input your own path that you would want to store regions on a virus that can be mapped to another virus
#  # you can customize the name of this type of mappability profile
#  mappability_profile_virus <-
#    create_mappability_profile("path/to/bam/files/folder/virus", category = "Unmappable region (virus)")
#  
#  # input your own path that you would want to store regions on a virus that can be mapped to the host genome
#  # you can customize the name of this type of mappability profile
#  mappability_profile_host <-
#    create_mappability_profile("path/to/bam/files/folder/host", category = "Unmappable region (host)")

## ----eval=FALSE---------------------------------------------------------------
#  # if you would like to keep everything in the same data frame, you may use the following code:
#  mappability_profile <-
#    create_mappability_profile("path/to/bam/files/folder/of/both/types/", category = "Unmappable region")

## ----eval=FALSE---------------------------------------------------------------
#  high_nucleotide_regions <-
#    create_high_nucleotide_content(gc = 0.6, a = 0.45)

## ----fig.width=7, fig.height=5------------------------------------------------

oldpar <- par(mfrow = c(1, 2))

## if you wish to plot all segments of one sample, you can try:
# plot_cov(covs = example_cov["S1"])

## if you wish to plot all segments from all samples, you can try:
# plot_cov(covs = example_cov)

## if you wish to plot certain segments from one sample, you can try:
segs = c("42jtlrir", "m0kacxse")
covs_selected = list()
covs_selected$`305S` <-
  example_cov$`305S`[segs]

## if you have many segments that you would want to plot, you can try the following code with the numbers changed
## to find the index of your desired segments:

covs_selected$S1 <-
  example_cov$S1[names(example_cov$S1)[c(1,72)]]

par(mar = c(2, 4, 1, 1))
layout(matrix(c(1, 1, 2, 3, 3, 4), nrow = 3))
plot_cov(covs = covs_selected)

par(oldpar)


