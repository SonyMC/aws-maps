# User variable
variable "environment" {
  type    = string # any, number, bool, list, map, set , object, tuple, string
  default = "DEV"
}

# User variable as a map
#variable "users" {
#  default = {
#    kannan_muthlali : "banker",
#    kutti_shrank : "collector",
#    parole_vasu : "goon" }
#}


# User variable as a map within a map
variable "users" {
  default = {
    kannan_muthlali : { specialisation : "banker", dept : "themmadi" },
    kutti_shrank : { specialisation : "collector", dept : "themmadi" },
    parole_vasu : { specialisation : "goon", dept : "themmadi" }
  }
}

# Provider info
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.46"
}

# Define IAM user
resource "aws_iam_user" "my_iam_users" {

  ## Note : A simple count and name will result in a list which will cause confusion while tryitg to add an alelemtn as each time the resounrces will be recreated. Altenragte approach given below and thsi is commented out
  #count = length(var.names)
  #name  = "${var.environment}_${var.names[count.index]}"


  ##Note : Usig a set/list: The belwo method will allow for assigning the naame as the index key instead of 0,1,2 etc. 
  #for_each = toset(var.names)   // convert list to a set
  #name = "${var.environment}_${each.value}" // now assign that set to var using values in the terraform.tfvars file

  ##Note : Using a map 
  for_each = var.users
  name     = "${var.environment}_${each.key}"
  tags = {
    #specialisation : each.value  // simple map
    specialisation : each.value.specialisation // map within a map   
    department : each.value.dept               // map within a map
  }


}



