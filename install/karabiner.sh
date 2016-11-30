#!/bin/sh

cat > ~/.karabiner.d/configuration/karabiner.json << EOF
{
  "profiles": [
    {
      "name": "Default profile",
      "selected": true,
      "simple_modifications": {
        "caps_lock": "escape"
      }
    }
  ]
}
EOF
