# ===============================
# Firewall Private IP Output
# ===============================
output "out_firewall_private_ip" {
  value = azurerm_firewall.fw.ip_configuration[0].private_ip_address
}
