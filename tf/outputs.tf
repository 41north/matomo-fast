output "droplet_ip" {
  value = digitalocean_floating_ip.matomo_floating_ip.ip_address
}
