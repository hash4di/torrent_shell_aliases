function magnet_name_raw() {
  case $1 in
    magnet:?*dn=?*)
      echo "$1" | \
        tr '&' "\n" | \
        tr ';' "\n" | \
        grep "^dn=" | \
        cut -f 2 -d '=' | \
        sed -e 's/&amp//g'
      ;;
  esac
}
