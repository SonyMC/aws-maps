# This file is used to override user variables set in the main.tf  file
environment = "dev"

# Names a s alist/set
# names = ["tfvars_kodali_kumar","tfvars_blade_shashi","tfvars_kannan_muthlali", "tfvars_kutti_shrank", "tfvars_parole_vasu"] 

# Users as a map
#users = {
#  tfvars_kodali_kumar : "hitman",
#  tfvars_blade_shashi : "link_to_kannan_muthalali",
#  tfvars_kannan_muthlali : "banker",
#  tfvars_kutti_shrank : "collector",
#  tfvars_parole_vasu : "goon"
#}

# Users as a map within a map

users = {
  tfvars_kodali_kumar : { specialisation : "hitman", dept : "themmadi" },
  tfvars_blade_shashi : { specialisation : "link_to_kannan_muthalali", dept : "themmadi" },
  tfvars_kannan_muthlali : { specialisation : "banker", dept : "themmadi" },
  tfvars_kutti_shrank : { specialisation : "collector", dept : "themmadi" },
  tfvars_parole_vasu : { specialisation : "goon", dept : "themmadi" }
}

