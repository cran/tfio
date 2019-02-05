as_tf_dataset <- function (dataset, additional_class_tags = NULL) {
  if (!is_dataset(dataset))
    stop("Provided dataset is not a TensorFlow Dataset")
  if (!inherits(dataset, "tf_dataset"))
    class(dataset) <- c("tf_dataset", class(dataset), additional_class_tags)
  dataset
}

is_dataset <- function (x) {
  inherits(x, "tensorflow.python.data.ops.dataset_ops.Dataset") || is_tfio_dataset(x)
}

is_tfio_dataset <- function(x) {
  grepl("tensorflow_io", class(x))
}
