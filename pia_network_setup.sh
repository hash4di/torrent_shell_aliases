# Setup privateinternetaccess.com routing docker image.
#
# It is used by aria2_vpn_pia script to route the network traffic.
#
# Example usage:
#   pia_network_setup Romania
function pia_network_setup() {
  docker ps | grep -q "pia-$1" || \
  docker run --cap-add=NET_ADMIN --device=/dev/net/tun --name="pia-$1" -d \
    --dns 209.222.18.222 --dns 209.222.18.218 \
    -e "REGION=$1" \
    -e "USERNAME=$PIA_USERNAME" \
    -e "PASSWORD=$PIA_PASSWORD" \
    colinhebert/pia-openvpn
  return $?
}
