docker run -p 8888:8888 -d --name jupyter jupyter/scipy-notebook:acb539921413

docker restart jupyter

docker cp ./ jupyter:/home/jovyan