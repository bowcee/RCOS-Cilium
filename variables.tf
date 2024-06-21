variable "CLIENT_SECRET"{
    type = string
    description = "Password for the azure cli user"
}
variable "CLIENT_ID"{
    type = string
    description = "appId for the azure cli user"
}
variable "TENANT_ID"{
    type = string
    description = "tenant id for the rcos-cilium_group resource group"
}
variable "SUBSCRIPTION_ID"{
    type = string
    description = "subscription id for the rcos-cilium_group resource group"
}
variable "RESOURCE_GROUP_LOCATION"{
    type = string
    description = "location for the rcos-cilium resource group"
    #For some reason we can't add a new 
}
