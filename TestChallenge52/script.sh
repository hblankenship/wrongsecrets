#!/bin/bash
docker login
#replace pastekitoo by your username to build a docker image
docker build -f Dockerfile.debug -t pastekitoo/debug-container:latest .
#Same
docker push pastekitoo/debug-container:latest
#Same to launch a debug container
kubectl debug -it $(kubectl get pod -l app=secret-challenge -o jsonpath="{.items[0].metadata.name}") --image=pastekitoo/debug-container:latest   --target=secret-challenge   --profile=restricted   -- /bin/bash
#You can now use gdb on the process launched for challenge52
ps aux | grep secret
gdb -p <PID>
print secret
