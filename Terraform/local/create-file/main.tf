# Generate Random Number
resource "random_integer" "rnd_int" {
  min = 1
  max = 3
}

# Creates file with a given name, content and set permissions
resource "local_file" "file1" {
  content         = "Hello World from Terraform!!!"
  filename        = "hello.txt"
  file_permission = "0777"
}

# Creates file with the variables defined in variables.tf
resource "local_file" "file2" {
  content         = var.file_content
  filename        = var.file_name
  file_permission = var.file_permissions
}


# Creates file with the variables defined in variables.tf
# It also has conditional expression to set the default file name if nothing is passed
resource "local_file" "file3" {
  content         = var.file_content
  filename        = var.optional_file_name == "" ? "hello-default.txt" : var.optional_file_name
  file_permission = var.file_permissions
}

# Create N number of files based on the given variable
resource "local_file" "file4" {
  count = var.file_count
  
  filename = "hello${count.index}"
  file_permission = "0777"
  content = "${var.file_content}-${count.index}"
}

# Creates multiple files using for_each
resource "local_file" "file5" {
  for_each = var.files

  filename = each.key
  content = "${var.file_content} from file ${each.key}"
  file_permission = var.file_permissions
}