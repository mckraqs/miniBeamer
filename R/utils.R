pkg_resource = function(main_dir, ...) {
  system.file(main_dir, ..., package = 'miniBeamer', mustWork = TRUE)
}