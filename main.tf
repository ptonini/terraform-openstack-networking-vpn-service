resource "openstack_vpnaas_service_v2" "this" {
  name           = var.name
  subnet_id      = var.subnet_id
  router_id      = var.router_id
  admin_state_up = var.admin_state_up
}

resource "openstack_vpnaas_site_connection_v2" "this" {
  for_each       = var.connections
  vpnservice_id  = openstack_vpnaas_service_v2.this.id
  name           = each.key
  psk            = each.value.psk
  ikepolicy_id   = each.value.ikepolicy_id
  ipsecpolicy_id = each.value.ipsecpolicy_id
  peer_address   = each.value.peer_address
  peer_id        = coalesce(each.value.peer_id, each.value.peer_address)
  peer_cidrs     = each.value.peer_cidrs
}