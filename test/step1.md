We will be using a jupyter notebook inside a docker container with all python libraries pre-installed. First, you will setup the environment.

1. Execute the command `chmod +x ./prepareContainer.sh && ./prepareContainer.sh`{{execute}} to setup the notebook inside a docker container. This might take few miuntes as the image size is large.

2. In the ouput of the last command, the alphanumeric code visible below "Currently" is your token. Copy it to clipboard.

3. Go to the **Jupyter Notebook** tab to the right of the current **Terminal** tab. If the jupyter notebook has not loaded successfully yet, click on the "Try Again" link to reload.

4. Once reloaded, paste the previously copied token to the "Password or token" field. Press Enter or click "Log in". Your notebook is ready.