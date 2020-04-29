function aria2_vpn_pia_stop_openvpn() {
  docker ps | grep colinhebert/pia-openvpn | cut -b1-12 | parallel docker stop
}
