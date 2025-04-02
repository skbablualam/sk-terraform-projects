output "vm_public_ip" {
  description = "Public IP of VM"
  value       = azurerm_public_ip.vm_ip.ip_address
}

output "storage_account_name" {
  description = "Storage Account Name"
  value       = azurerm_storage_account.storage.name
}

output "db_endpoint" {
  description = "PostgreSQL database endpoint"
  value       = azurerm_postgresql_server.mydb.fqdn
}