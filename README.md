# Docker_Nodejs

## Getting started with docker and containers frame work setup and all

# confluence: https://maheshpallapothula.atlassian.net/wiki/spaces/SD/pages/14057484/Docker
# these confluence page can drive you fully how can deploy you code in docker and build docker running docker port push the container image to a docker repository like that.


## Docker Application

. npm init -y
. server.js file
. package.json file start: node server.js

npm install express

. const express = require("express");

    const app = express();

    app.get("/", (req, res) => {
     res.json({
    status: 200,
    message: "Hello Docker You are running.",
    });
    });

    app.listen(3000, () => {
    console.log("Hello Server You are Running..... on port 3000");
    });

. add .dockerignore file
node_modules

. create Dockerfile
FROM node:18 ### Base Node APP#
WORKDIR /app ### Create app directory
COPY . . ### Copy entire Source Code Local to Container
RUN npm install #RUN npm update
EXPOSE 3000 ### Expose the APP in Below Port
CMD ["npm", "start"] ### start the container

    ### Base Node APP#
    FROM node:16.15-alpine

    ### Create app directory
    WORKDIR /usr/src/app

    ### Copy the package.json file to Container
    COPY package*.json ./

    #RUN npm update
    RUN npm i

    ### Copy entire Source Code Local to Container
    COPY . .

    ### Creates a "dist" folder with the production build
    RUN npm run build

    ### Set NODE_ENV environment variable
    ENV NODE_ENV production

    ### Expose the APP in Below Port
    EXPOSE 3000

    ### Start the server using the production build
    CMD [ "node", "dist/src/main.js" ]

. after creating the docker file open terminal and run these command

    ### Here -t means tag and . means you local application
    docker build -t docker-app:latest .

    ### Here -p means port and -d means run not in debug mode / detach mode if you want to see the logs then you cannot -d into the command
    docker run -p 3000:3000 -d docker-app:latest

    ### run clear
    clear

    ### show currently running containers in your local
    docker ps

    ### docker images to show all the images in you local docker
    docker images

    ### iam tagging these images to my docker repo
    docker tag docker-app maheshpallapothula/docker-app:latest

    ### push into your docker container
    docker push maheshpallapothula/docker-app:latest

    ### stop your running application
    docker stop b8d70

    ### to show all containers
    docker ps -a

    ### remove containers
    docker rm <container Id>

    ### remove images
    docker rmi <imagename>:<tag>