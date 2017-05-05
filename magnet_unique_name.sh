function magnet_unique_name() {
  echo `magnet_name "$1"`-`echo "$1" | md5sum | cut -f 1 -d ' '`
}
