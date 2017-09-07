function html_download_torrents() {
  SUFFIX="torrent" html_list_links_with_suffix "$@" | \
    parallel \
      -v \
      "aria2c --bt-save-metadata --seed-time=60 -q {}" 2>/dev/null
}
