FROM node:16

# Create app directory
WORKDIR /usr/src/app

COPY . .
RUN npm install

EXPOSE 3000
CMD [ "node", "index.js" ]
