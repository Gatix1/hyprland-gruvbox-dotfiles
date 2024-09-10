hyprctl \
  --batch "$(
    hyprctl devices -j |
      jq -r '.keyboards[] | .name' |
      while IFS= read -r keyboard; do
        printf '%s %s %s;' 'switchxkblayout' "${keyboard}" 'next'
      done
  )"

# get-lang
# if we switch all of them, then getting any of them (the first) works.
hyprctl devices -j |
  jq -r '.keyboards[] | .active_keymap' |
  head -n1 |
  cut -c1-2 |
  tr 'a-z' 'A-Z' > ~/.cache/kb_layout

