# Docker image for Rsync deployment
 
This image is mainly used for deployments with Rsync from a docker container in Gitlab.
 
The [Gitlab documentation](https://docs.gitlab.com/ee/ci/ssh_keys/README.html#ssh-keys-when-using-the-docker-executor)
explains how to use SSH keys using the Docker executor. 
 
This image provides some shortcuts: `bash`, `ssh` and `rsync` are already installed. The script
`ssh-deactivate-key-checking` provides a simple way to deactivate `StrictHostKeyChecking` for SSH.

Example usage in `.gitlab-ci.yml`:

      script:
        - eval $(ssh-agent -s)
        - "ssh-add <(echo \"$SSH_PRIVATE_KEY\")"
        - ssh-deactivate-key-checking
        - rsync -av ./www/ user@server:/var/www/
