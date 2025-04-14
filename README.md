# Librechat Desktop Integration for Linux
This is a simple setup script which provides `.desktop` files for using LibreChat seamlessly on the Linux desktop. No more messing around with terminal windows every time you want to chat to an AI!

[Librechat](https://github.com/danny-avila/LibreChat) allows you to seamlessly call your favorite AI APIs in a chat interface. It lets you pay-as-you-go for AI chats, instead of needing to sign up for a subscription you may not use fully.

## Dependencies
* Docker
* Docker Compose
* An internet browser
* A linux desktop environment (tested in XFCE)

## Installation
Clone this repository then `cd` into it. Run the following in a bash shell:
```
./setup.sh
```

## Usage
This 

## Data Migration
To migrate data from an existing LibreChat installation:

1. Locate your existing LibreChat `data_node` directory
2. Copy it to `$XDG_DESKTOP_HOME/librechat`

This will migrate your MongoDB database containing user logins and chat history.

Note: Additional configuration may be required. Please report any issues.

## Configuration
The default `.env` file is configured for local usage. You can modify it after installation at:

```
$XDG_DESKTOP_HOME/librechat/.env
```

For further info on configuration, refer to the [Librechat docs](https://www.librechat.ai/docs/configuration)