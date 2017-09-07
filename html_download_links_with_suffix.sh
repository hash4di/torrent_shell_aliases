function html_download_links_with_suffix() {
  html_list_links_with_suffix "$@" | \
    parallel \
      -v \
      "wget {}" 2>/dev/null
}
