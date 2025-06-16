# Server settings

## 📁 File Structure
For laravel you need to create some folders inside your `secrets`.
```bash
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