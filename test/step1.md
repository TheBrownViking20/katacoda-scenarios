We will be using a jupyter notebook inside a docker container with all python libraries pre-installed. First, you will setup the environment.

1. Execute the command `docker exec -it jupyter bash -c 'jupyter notebook list' | cut -d'=' -f 2 | cut -d' ' -f 1`{{execute}} when the docker container starts running(after the environment has been set). This might take few miuntes as the image size is large.

2. In the output of the last command, the last line i.e., the alphanumeric code is your token. Copy it to clipboard.

3. Go to the **Jupyter Notebook** tab to the right of the current **Terminal** tab. If the jupyter notebook has not loaded successfully yet, click on the "Try Again" link to reload.

4. Once reloaded, paste the previously copied token to the "Password or token" field. Press Enter or click "Log in". Your notebook is ready.