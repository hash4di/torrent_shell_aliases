function magnet_echo() {
  local magnet_echo_MAGNET
  for magnet_echo_MAGNET in $@
  do
    case $magnet_echo_MAGNET in
      magnet:?*dn=?*)
        echo $magnet_echo_MAGNET
        ;;
    esac
  done
}
