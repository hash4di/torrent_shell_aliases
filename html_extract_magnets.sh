function html_extract_magnets() {
  local html_extract_magnets_FILE
  for html_extract_magnets_FILE in $@
  do
    cat $html_extract_magnets_FILE | \
      sed -e  "s/href=\"magnet:/|magnet:/g" -e "s/\" /|/g" | \
      tr '|' "\n" | \
      grep "^magnet:"
  done
}
