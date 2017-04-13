function html_magnets_get() {
  local html_magnets_get_FILE
  for html_magnets_get_FILE in $@
  do
    html_extract_magnets $html_magnets_get_FILE | parallel 'source ~/.compiled_shell_aliases.sh && echorun magnet_get {}'
  done
}
