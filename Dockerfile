# # Use an official Node.js runtime as a base image
# FROM node:14

# # Set the working directory inside the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# # Install app dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# # Expose the port your app runs on
# EXPOSE 3000

# # Define the command to run your app
# CMD ["npm", "start"]


################################################################
# real folder structure
### Base Node APP#
# FROM node:16.15-alpine

# ### Create app directory
# WORKDIR /usr/src/app

# ### Copy the package.json file to Container 
# COPY package*.json ./

# #RUN npm update
# RUN npm i

# ### Copy entire Source Code Local to Container
# COPY . .

# ### Creates a "dist" folder with the production build
# RUN npm run build

# ### Set NODE_ENV environment variable
# ENV NODE_ENV production

# ### Expose the APP in Below Port
# EXPOSE 3000

# ### Start the server using the production build
# CMD [ "node", "dist/src/main.js" ]
################################################################

FROM node:slim
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 3000
CMD node index.js
