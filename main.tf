# 1. Resource group: a folder in Azure that holds everything for this lab
resource "azurerm_resource_group" "lab" {
  name     = "${var.prefix}-rg"
  location = var.location

  tags = {
    project = "fundserv-training"
    owner   = "ebrahim"
  }
}

# 2. Virtual network: your private network in Azure
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
}

# 3. Subnet: a smaller section of the network where servers will live
resource "azurerm_subnet" "app" {
  name                 = "${var.prefix}-snet-app"
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

# 4. Network security group: firewall rules for the subnet
resource "azurerm_network_security_group" "app" {
  name                = "${var.prefix}-nsg-app"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name

  security_rule {
    name                       = "allow-ssh-from-my-ip"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.my_ip
    destination_address_prefix = "*"
  }
}

# 5. Attach the firewall rules to the subnet
resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}