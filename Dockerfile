FROM node:16

# Create app directory
WORKDIR /usr/src/app

COPY . .
RUN npm install

EXPOSE 8889
CMD [ "node", "index.js" ]
