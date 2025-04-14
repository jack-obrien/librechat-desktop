#!/bin/bash

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
LIBRECHAT_PATH="$XDG_DATA_HOME/LibreChat"

mkdir -p "$LIBRECHAT_PATH"
mkdir -p "$XDG_DATA_HOME/applications"

# Get the latest release of LibreChat
echo "Cloning LibreChat..."
if [ "$(ls -A $LIBRECHAT_PATH)" ]
then
	cd $LIBRECHAT_PATH
	# Assume the appropriate git repo is saved at $LIBRECHAT_PATH
	git checkout v0.7.7
else
	git clone https://github.com/danny-avila/LibreChat.git "$LIBRECHAT_PATH"
	# Use the default config
	cp $LIBRECHAT_PATH/.env.example $LIBRECHAT_PATH/.env
fi

# Create desktop file
cat > "$XDG_DATA_HOME/applications/librechat.desktop" << EOF
[Desktop Entry]
Name=LibreChat
Comment=Local AI Chat Interface
Path=$LIBRECHAT_PATH
Exec=bash -c "cd $LIBRECHAT_PATH && docker compose up & xdg-open http://localhost:3080"
Terminal=false
Type=Application
Categories=Network;Chat;
EOF

# Create desktop file to close librechat.
cat > "$XDG_DATA_HOME/applications/librechat_stop.desktop" << EOF
[Desktop Entry]
Name=Stop LibreChat
Comment=Close local web server running LibreChat
Path=$LIBRECHAT_PATH
Exec=bash -c "cd $LIBRECHAT_PATH && docker compose down
Terminal=false
Type=Application
Categories=Network;Chat;
EOF
