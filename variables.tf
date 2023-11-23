variable "name" {}

variable "subnet_id" {}

variable "router_id" {}

variable "admin_state_up" {
  default = "true"
}

variable "connections" {
  type = map(object({
    ikepolicy_id   = string
    ipsecpolicy_id = string
    psk            = string
    peer_address   = string
    peer_id        = optional(string)
    peer_cidrs     = set(string)
  }))
}