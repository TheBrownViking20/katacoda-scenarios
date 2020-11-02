apt install bsdtar -y

curl -L https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/python/2020.5.86806/vspackage | bsdtar -xvf - extension

mv extension /opt/.katacodacode/extensions/mspython