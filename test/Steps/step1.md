We will be using a jupyter notebook inside a docker container with all python libraries pre-installed. First, you will setup the environment.

Execute the command `docker exec -it jupyter bash -c 'jupyter notebook list' | cut -d'=' -f 2 | cut -d' ' -f 1`{{execute}} when the docker container starts running (after the environment has been set). This might take few miuntes as the image size is large.

In the output of the last command, the last line i.e., the alphanumeric code is your token. Copy it to clipboard.

Go to the **Jupyter Notebook** tab to the right of the current **Terminal** tab. If the jupyter workspace has not loaded successfully yet, click on the "Try Again" link to reload. You can also reload using reload icon on the **Jupyter Notebook** tab 

Once reloaded, paste the previously copied token to the "Password or token" field. Press Enter or click "Log in". Your Jupyter workspace is ready.