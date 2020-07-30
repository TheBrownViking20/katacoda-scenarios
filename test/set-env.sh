docker run -p 8888:8888 -d --name jupyter jupyter/scipy-notebook

docker restart jupyter

docker cp ./ jupyter:/home/jovyan