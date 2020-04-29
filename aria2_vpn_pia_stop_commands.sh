function aria2_vpn_pia_stop_commands() {
  docker ps | grep pr0d1r2/alpine-aria2-command:latest | cut -b1-12 | parallel docker stop
}
