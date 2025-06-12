# Server settings

## 📁 File Structure
To make your server work it's required to follow a very specific server setup, which can be changed at any time. Your basic server structure should look something like this:
```bash
# Anything enclosed in {curly-braces} will be automatically replaced in deployment

{deploy-path}
│
└── {repo-name}
    ├── .secrets
    │   ├── databases
    │   │   └── hml-{branch-name}-mysql-data
    │   ├── storage
    │   ├── .env # Production env
    │   └── .env.hml # Development env
    └── {branch-name}

# {repo-name}: Your repository name
# {branch-name}: Your branch name (main, func/1 [turn to func-1], etc)
# {deploy path}: Your deploy path, like "/var/www/my-app"
```

## Environment Variables

Your repository environment variables should be placed at:
* `.secrets/.env`: For production;
* `.secrets/.env.hml`: For development.

Theres `Env Files` will be copied to your project root directories.

Each env file must have special variables set:
```ini
# Production
BRANCH_NAME="{{BRANCH_NAME}}"
DOMAIN="{{DOMAIN}}"
APP_URL="{{APP_URL}}"
ASSET_URL="{{ASSET_URL}}"
APP_ENV="{{APP_ENV}}"
APP_DEBUG="{{APP_DEBUG}}"
STORAGE_PATH="{{STORAGE_PATH}}"

# Development
BRANCH_NAME="{{BRANCH_NAME}}"
DOMAIN="{{DOMAIN}}"
PMA_DOMAIN="{{PMA_DOMAIN}}"
SESSION_COOKIE="{{SESSION_COOKIE}}"
APP_URL="{{APP_URL}}"
ASSET_URL="{{ASSET_URL}}"
APP_ENV="{{APP_ENV}}"
APP_DEBUG="{{APP_DEBUG}}"
DB_PASSWORD="{{DB_PASSWORD}}"
DATABASE_PERSIST_PATH="{{DATABASE_PERSIST_PATH}}"
```

## 🛠️ Configuration

This deployer was make to be used with a `traefik` container running for automated sub-domain creation and ssl issuing.

To configure `traefik` docker container use the example [`Traefick docker-compose.yml`](traefik.docker-compose.yml)

Your production app can have a database default connection, for this you can use the [`Database docker-compose.yml`](database.docker-compose.yml), which creates a `mysql` database container and a `phpmyadmin` pannel mapped to `pma.{your-domain-name}`.