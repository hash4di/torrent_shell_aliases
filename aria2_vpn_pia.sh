# Download files via privateinternetaccess.com VPN.
#
# Useful especially for downloading torrents anonymously.
#
# Example usage:
#   aria2_vpn_pia example.torrent
function aria2_vpn_pia() {
  local aria2_vpn_pia_DATA_NAME
  local aria2_vpn_pia_SERVICE_NAME
  local aria2_vpn_pia_ERR
  local aria2_vpn_pia_THREAD
  aria2_vpn_pia_DATA_NAME="aria2-data-$$"
  aria2_vpn_pia_SERVICE_NAME="aria2-service-$$"
  aria2_vpn_pia_THREAD="$(pia_detect_thread)"
  case "$aria2_vpn_pia_THREAD" in
    None)
      echo "No free threads!!!"
      return 20
      ;;
  esac
  pia_network_setup "$aria2_vpn_pia_THREAD" || return $?
  docker pull pr0d1r2/alpine-aria2-command:latest || return $?
  docker create --name $aria2_vpn_pia_DATA_NAME -v "$(pwd -P):/mnt" pr0d1r2/alpine-aria2-command:latest || return $?
  aria2_vpn_pia_ERR="$?"
  if [ $aria2_vpn_pia_ERR -eq 0 ]; then
    docker run \
      -e ARIA2_DIR=/mnt \
      -e ARIA2_RPC=false \
      -e ARIA2_RPC_SECRET="$(pwgen 64 1)" \
      -e ARIA2_BT_REQUIRE_CRYPTO=false \
      -e ARIA2_BT_MIN_CRYPTO_LEVEL=plain \
      -e ARIA2_SEED_TIME=0 \
      --rm -w=/mnt \
      --net="container:pia-$aria2_vpn_pia_THREAD" --volumes-from "$aria2_vpn_pia_DATA_NAME" --name "$aria2_vpn_pia_SERVICE_NAME" \
      pr0d1r2/alpine-aria2-command:latest /usr/local/bin/aria2c --conf-path /etc/aria2/aria2.conf "$@"
    aria2_vpn_pia_ERR="$?"
  fi
  docker rm "$aria2_vpn_pia_DATA_NAME"
  rm -f "/tmp/.pia-$aria2_vpn_pia_THREAD"
  return "$aria2_vpn_pia_ERR"
}
