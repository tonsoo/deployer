# Server settings

## 📁 File Structure
To make your server work it's required to follow a very specific server setup, which can be changed at any time. Your basic server structure should look something like this:
```bash
# Anything enclosed in {curly-braces} will be automatically replaced in deployment

{deploy-path}
│
└── {repo-name}
    ├── .secrets # Folder that will store your project secrets
    └── {branch-name}

# {repo-name}: Your repository name
# {branch-name}: Your branch name (main, func/1 [turn to func-1], etc)
# {deploy path}: Your deploy path, like "/var/www/my-app"
```

## Deploy Multiple App Types

You can deploy to multiple app types:

1. **Laravel:** [Read laravel server peculiarities docs](laravel/Readme.md)
2. **React:** [Read laravel server peculiarities docs](react/Readme.md)

## 🛠️ Configuration

This deployer was make to be used with a `caddy` container running for automated sub-domain creation and ssl issuing.

To configure `caddy` docker container use the example [`Caddy docker-compose.yml`](caddy.docker-compose.yml)

Your production app can have a database default connection, for this you can use the [`Database docker-compose.yml`](.database.docker-compose.yml), which creates a `mysql` database container and a `phpmyadmin` pannel mapped to `pma.{your-domain-name}`.