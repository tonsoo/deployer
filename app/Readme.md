# App Settings

## 🕵️‍♂️ How to configure

### 1. Docker compose
Configuring your app is fairly simple, you only need to copy the three docker compose files to your app root directory:
* [`Local docker-compose.yml`](docker-compose.local.yml): For local development only, on your machine;
* [`Dev docker-compose.yml`](docker-compose.dev.yml): For server dev mode development, so in another branch using another subdomain for testing;
* [`Prod docker-compose.yml`](docker-compose.prod.yml): For your production app, on your main domain.

**It's recommended to change these values in each docker-compose file:**
* `my-app`: Should be replaced by your actual app name, such as `my-app-name`, `project-app`, `large-secrect-project`, etc;
* `myappdatabase`: Your app database name;
* `myappuser`: Your app username;
* `my-app-secure-password`: Your local database password;
* `my-app-super-secure-password`: Your local root database password.

After configuring all that it's essential to have your php image, there are you Dockerfiles at [`dockerfiles`](dockerfiles), one using the official PHP's FastCGI image and the second using Fran, but you can use whatever you want to run this!

### 2. Deployment script

After setting up your app with your docker-compose information you need a workflow file, I recomment creating two:
1. `.github/workflows/deploy.yml`: For general deployments;
1. `.github/workflows/cleanup.yml`: For cleaning deleted branches.

The workflow files can be seen at [`workflows`](workflows)