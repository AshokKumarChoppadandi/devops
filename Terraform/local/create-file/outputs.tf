
output "rnd_int_op" {
  value = random_integer.rnd_int.result
}

# Prining the output defained for variable defaultText
output "defaultText" {
  value = var.text
}