function html_download_torrents() {
  parallel \
    'cat {} | grep torrent | sed -e "s/href=/|/g" | tr "|" "\n" | grep torrent | cut -f 2 -d "\""' \
    ::: \
    $@ 2>/dev/null | \
    parallel \
      -v \
      "aria2c --bt-save-metadata -q {}" 2>/dev/null
}
