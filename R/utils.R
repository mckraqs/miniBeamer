pkg_resource = function(main_dir, ...) {
  system.file(main_dir, ..., package = 'miniBeamer', mustWork = TRUE)
}

fix_envs = function(x){
  beg_reg <- '^\\s*\\\\begin\\{.*\\}'
  end_reg <- '^\\s*\\\\end\\{.*\\}'
  i3 = if (length(i1 <- grep(beg_reg, x))) (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]

  i3 = c(i3,
         if (length(i2 <- grep(end_reg, x))) (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
  )
  if (length(i3)) x = x[-i3]
  x
}