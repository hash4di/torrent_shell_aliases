function aria2_vpn_pia_reset() {
  echorun docker_stop_all_containers
  sleep 1
  pia_regions | parallel "rm /tmp/.pia-{} ; docker rm /pia-{}"
  case "$1" in
    "")
      ;;
    *)
      aria2_vpn_pia "$@"
      ;;
  esac
  return $?
}
