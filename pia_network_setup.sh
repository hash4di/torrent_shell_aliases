# Setup privateinternetaccess.com routing docker image.
#
# It is used by aria2_vpn_pia script to route the network traffic.
#
# Example usage:
#   pia_network_setup
function pia_network_setup() {
  docker ps | grep -q "pia-openvpn" || \
  docker run --cap-add=NET_ADMIN --device=/dev/net/tun --name=pia -d \
    --dns 209.222.18.222 --dns 209.222.18.218 \
    -e 'REGION=Romania' \
    -e "USERNAME=$PIA_USERNAME" \
    -e "PASSWORD=$PIA_PASSWORD" \
    colinhebert/pia-openvpn
  return $?
}
