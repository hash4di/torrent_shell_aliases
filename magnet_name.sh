function magnet_name() {
  case $1 in
    magnet:?*dn=?*)
      urldecode "`magnet_name_raw $1`" | \
        tr -c "[^A-Za-z0-9-]" "_" | \
        sed -e 's/%$//g'
      ;;
  esac
}
