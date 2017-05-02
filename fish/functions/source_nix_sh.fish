eval (bash -c "source ~/.nix-profile/etc/profile.d/nix.sh; fish --command 'echo set -x NIX_PATH \"\$NIX_PATH\"\;; echo set -x PATH \"\$PATH\"\;; echo set -x SSL_CERT_FILE \"\$SSL_CERT_FILE\"'")
