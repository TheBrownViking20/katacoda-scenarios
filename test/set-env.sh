 
docker run -p 8888:8888 -d --name jupyter jupyter/scipy-notebook:83ed2c63671f

docker restart jupyter

echo 'restarted Jupyter container'

docker logs jupyter