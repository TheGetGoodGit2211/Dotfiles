if status is-interactive
  # @fish-lsp-disable-next-line 2003
  set -Ux fish_browser zen-browser
end

if set -q HYPERLAND_INSTANCE_SIGNATURE
  if test -f ~/.cache/wal/colors.sh
    bass source ~/.cache/wal/colors.sh
  end
end
