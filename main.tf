data "azurerm_resource_group" "rg" {
    name = "RCOS-Cilium_group"
}

resource "azurerm_virtual_network" "vnet"{
    name = "test-vnet"
    address_space = ["10.0.0.0/8"]
    location = var.RESOURCE_GROUP_LOCATION
    resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet"{
    name = "test-subnet"
    address_prefixes = ["10.240.0.0/16"]
    resource_group_name = data.azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "podsubnet"{
    name = "pod-subnet"
    resource_group_name = data.azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.241.0.0/16"]
}

resource "azurerm_kubernetes_cluster" "default" {
    name = "test-cilium-aks"
    location = var.RESOURCE_GROUP_LOCATION
    resource_group_name = data.azurerm_resource_group.rg.name
    dns_prefix = "test-cilum-k8s"
    kubernetes_version = "1.29.4"
    default_node_pool{
        name = "default"
        node_count = 1
        vm_size = "Standard_A2_v2"
        os_disk_size_gb = 30
        vnet_subnet_id = azurerm_subnet.subnet.id
    }
    service_principal{
        client_id = var.CLIENT_ID
        client_secret = var.CLIENT_SECRET
    }
    role_based_access_control_enabled = true
     network_profile {
         network_plugin = "none"
     }
}
