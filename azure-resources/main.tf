resource "azurerm_resource_group" "main" {
  name     = "MainResourceGroup"
  location = var.azure_region
}

resource "azurerm_virtual_network" "main" {
  name                = "MainVNet"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "public" {
  name                 = "PublicSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "allow_ssh" {
  name                = "AllowSSH"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "vm_ip" {
  name                = "PublicIP"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "VMNIC"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "IPConfig"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "MyVM"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.azure_region
  size                = var.vm_size
  admin_username      = "azureuser"
  admin_password      = var.db_password
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  disable_password_authentication = false
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.azure_region
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_postgresql_server" "mydb" {
  name                = "mydb-instance"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  administrator_login = var.db_username
  administrator_login_password = var.db_password
  version            = "11"
  ssl_enforcement_enabled = true
}