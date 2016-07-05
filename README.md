# viltrain
The purpose of this PoC was to design a workflow for bug reporting, fixing and retesting.

A user would log a ticket, when the ticket gets accepted a branch with the ticket name is automatically created for the specified project. When the developer commits to this branch, his code is build in a docker container and launched, an url to this instance is posted in the comments of the ticketing system. The user can now retest the fix in an isolated environment. When the ticket is closed the docker image is automatically stopped and the branch merged with master.

This repository pulls together several docker images and configuration to setup the following:
- A jenkins build server with a DSL script configured to automatically create jobs for all branches in a git repository.
- These jobs pull your code into a builder image which uses buildstep to detect the project's programming language, fetches the dependencies and compiles if necessary.
- Git script to launch the on-demand build docker images.
- Nginx based proxy server to dispatch requests to the right image based on dns name with a redis backend.
- Nginx logic to redirect when the container is starting up.



# Proxy
Based on openresty it proxy passes to containers based on a redis hash.

    sudo docker run -d --name proxy -p 80:8080 viltrain/proxy
    
# Redis-gen
Insert and keeps the redis hash up-to-date based on the running containers

    sudo docker run -d --name redis-gen -v /var/run/docker.sock:/tmp/docker.sock:ro viltrain/redis-gen
    
# Builder
Let your project inheret from this image

    FROM viltrain/builder
    EXPOSE 5000
    CMD ["python", "app.py"]
