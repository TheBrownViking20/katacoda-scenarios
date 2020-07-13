 
docker run -p 8888:8888 -d --name jupyter jupyter/scipy-notebook:83ed2c63671f

docker restart jupyter

docker cp ./ jupyter:/home/jovyan/work

docker exec -it jupyter bash -c 'jupyter notebook list' | cut -d'=' -f 2 | cut -d' ' -f 1