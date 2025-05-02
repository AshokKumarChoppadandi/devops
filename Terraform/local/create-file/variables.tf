variable "text" {
  type = string
  default = "DefaultText"
  description = "Default text value for the given variable"
}
variable "file_name" {
  type        = string
  description = "Name of the file with extension. Ex: hello.txt"
}

variable "file_permissions" {
  type        = string
  default     = "0777"
  description = "File permissions"
}

variable "file_content" {
  type        = string
  default     = "Hello World from Terraform!!!\n\nNote: Message defined in variables.tf"
  description = "File content which will be added to the created file"
}

variable "optional_file_name" {
  type        = string
  description = "Name of the file with extension. Ex: hello.txt"
}

variable "file_count" {
  type        = number
  default     = 3
  description = "Number of file to create"
  sensitive   = false
  nullable    = false
}

variable "files" {
  type = set(string)
  default = [ "hello-file1.txt", "hello-file2.txt", "hello-file3.txt" ]
}