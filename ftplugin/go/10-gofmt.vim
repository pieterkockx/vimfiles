if !executable("gofmt")
  finish
end

setlocal formatprg='gofmt'
