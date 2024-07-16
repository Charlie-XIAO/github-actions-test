input="please update lock-files [tag x]"

first_line=$(echo "$input" | head -n 1)
command="python build_tools/update_environments_and_lock_files.py"
is_valid=0

if [[ $first_line == "please update lock-files all" ]]; then
  is_valid=1
else
  select_tag=$(echo "$first_line" | sed -n 's/.*\[tag \([^]]*\).*/\1/p' | sed 's/"/\\"/g')
  select_build=$(echo "$first_line" | sed -n 's/.*\[build \([^]]*\).*/\1/p' | sed 's/"/\\"/g')
  skip_build=$(echo "$first_line" | sed -n 's/.*\[-build \([^]]*\).*/\1/p' | sed 's/"/\\"/g')

  if [[ -n "$select_tag" || -n "$select_build" || -n "$skip_build" ]]; then
    is_valid=1
    if [[ -n "$select_tag" ]]; then
      command+=" --select-tag \"$select_tag\""
    fi
    if [[ -n "$select_build" ]]; then
      command+=" --select-build \"$select_build\""
    fi
    if [[ -n "$skip_build" ]]; then
      command+=" --skip-build \"$skip_build\""
    fi
  fi
fi

echo "is_valid=$is_valid"
if [[ $is_valid -eq 1 ]]; then
  echo "update_script_args=$command"
fi
