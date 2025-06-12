# Server settings

## 📁 File Structure
To make your server work it's required to follow a very specific server setup, which can be changed at any time. Your basic server structure should look something like this:
```bash
# Anything enclosed in {curly-braces} will be automatically replaced in deployment

{deploy-path}
│
├── .secrets
│   ├── databases
│   │   └── hml-{branch-name}-mysql-data
│   └── storage
└── {branch-name}

# {branch-name}: Your branch name (main, func/1 [turn to func-1], etc)
# {deploy path}: Your deploy path, like "/var/www/my-app"
```

## 🛠️ Configuration

This deployer was make to be used with a `traefik` container running for automated sub-domain creation and ssl issuing.

To configure `traefik` docker container use the example [`Traefick docker-compose.yml`](traefik.docker-compose.yml)

Your production app can have a database default connection, for this you can use the [`Database docker-compose.yml`](database.docker-compose.yml), which creates a `mysql` database container and a `phpmyadmin` pannel mapped to `pma.{your-domain-name}`.