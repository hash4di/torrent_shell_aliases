function magnet_get() {
  local magnet_get_MAGNET
  for magnet_get_MAGNET in $@
  do
    magnet_get_NAME=`magnet_unique_name "$magnet_get_MAGNET"`
    if [ ! -d "$magnet_get_NAME" ]; then
      echorun mkdir "$magnet_get_NAME" || return $?
    fi
    if [ ! -e "$magnet_get_NAME/$magnet_get_NAME.magnet.done" ]; then
      echo "$magnet_get_MAGNET" > "$magnet_get_NAME/$magnet_get_NAME.magnet"
      aria2c \
        -d "$magnet_get_NAME" \
        -u 2k \
        --seed-time=0 \
        --file-allocation=none \
        `cat "$magnet_get_NAME/$magnet_get_NAME.magnet"` || return $?
      touch "$magnet_get_NAME/$magnet_get_NAME.magnet.done" || return $?
    else
      echo "$magnet_get_NAME.magnet DONE"
    fi
  done
}
