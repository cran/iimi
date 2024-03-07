## ----warning=FALSE, message=FALSE---------------------------------------------
library(iimi)

library(Biostrings)

## ----eval=FALSE, warning=FALSE------------------------------------------------
#     path_to_bamfiles <- list.files(
#       path = path/to/your/BAM/files/folder,
#       pattern = "bam$", full.names = TRUE,
#       include.dirs = TRUE
#     )

## ----eval=FALSE, warning=FALSE------------------------------------------------
#  cov_info <- convert_bam_to_rle(bam_file = path_to_bamfiles)

## ----eval=FALSE, warning=FALSE------------------------------------------------
#  df <- convert_rle_to_df(covs = example_cov)

## ----fig.width=7, fig.height=5------------------------------------------------
covs_selected = list()
covs_selected$S1 <-
  example_cov$S1[c("4c559wtw", "2kiu3uzt", "z9hs8khm", "ka4xfvq7")]

oldpar <- par(mfrow = c(1,2))

par(mar = c(1, 2, 1, 1))
layout(matrix(c(1, 1, 2, 5, 5, 6, 3, 3, 4, 7, 7, 8), nrow = 6))
plot_cov(covs = covs_selected)

par(oldpar)

## ----message=FALSE, warning=FALSE, results='hide', eval=FALSE-----------------
#  prediction_default <- predict_iimi(newdata = df)

## ----eval=FALSE---------------------------------------------------------------
#  # set seed
#  set.seed(123)
#  
#  # spliting into 80-20 train and test data set with the ten plant samples
#  train_names <- sample(levels(as.factor(df$sample_id)),
#                        length(unique(df$sample_id)) * 0.8)
#  
#  # trian data
#  train_x = df[df$sample_id %in% train_names, ]
#  
#  train_y = c()
#  
#  for (ii in 1:nrow(train_x)) {
#    train_y = append(train_y, example_diag[train_x$seg_id[ii],
#                                           train_x$sample_id[ii]])
#  }
#  
#  # test data
#  test_x = df[df$sample_id %in% train_names == F, ]
#  
#  test_y = c()
#  
#  for (ii in 1:nrow(train_x)) {
#    test_y = append(test_y, example_diag[train_x$seg_id[ii],
#                                         train_x$sample_id[ii]])
#  }

## ----message=FALSE, warning=FALSE, results='hide', eval=FALSE-----------------
#  fit <- train_iimi(train_x = train_x, train_y = train_y)

## ----eval=FALSE---------------------------------------------------------------
#  prediction_customized <-
#    predict_iimi(newdata = test_x,
#                 trained_model = fit)

## ----eval=FALSE---------------------------------------------------------------
#  mappability_profile_virus <-
#    create_mappability_profile(path/to/bam/files/folder/virus, category = "Unmappable region (virus)")
#  mappability_profile_host <-
#    create_mappability_profile(path/to/bam/files/folder/host, category = "Unmappable region (host)")

## ----eval=FALSE---------------------------------------------------------------
#  high_nucleotide_regions <- create_high_nucleotide_content()

