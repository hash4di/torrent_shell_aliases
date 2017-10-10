function html_list_links_with_suffix() {
  if [ -z "$SUFFIX" ]; then
    echo "Please set SUFFIX shell variable!"
    return 200
  fi
  parallel \
    "cat {} | grep '$SUFFIX' | sed -e 's/href=/|/g' | tr '|' '\\n' | cut -f 2 -d '\"' | grep '\\.$SUFFIX' | sed -e 's/\\&amp;/\\&/g' | sort | uniq" \
    ::: \
    "$@" 2>/dev/null
  return $?
}
