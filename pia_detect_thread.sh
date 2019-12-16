function pia_detect_thread() {
  local pia_detect_thread_REGION

  for pia_detect_thread_REGION in $(pia_regions)
  do
    if [ ! -e "/tmp/.pia-$pia_detect_thread_REGION" ]; then
      touch "/tmp/.pia-$pia_detect_thread_REGION"
      echo "$pia_detect_thread_REGION"
      return 0
    fi
  done

  echo "None"
  return 1
}
