# App Settings for React

## 🕵️‍♂️ How to configure

### 1. Docker compose
Configuring your app is fairly simple, you only need to copy the [`docker-compose.yml`](docker-compose.yml) file and [`docker`](docker) folder to your app root directory.

**It's recommended to change these values in your docker-compose file:**
* `my-app`: Should be replaced by your actual app name, such as `my-app-name`, `project-app`, `large-secrect-project`, etc;

### 2. Deployment script

After setting up your app with your docker-compose information you need a workflow file, I recomment creating two:
1. `.github/workflows/deploy.yml`: For general deployments;
1. `.github/workflows/cleanup.yml`: For cleaning deleted branches.

The workflow files can be seen at [`workflows`](../workflows)