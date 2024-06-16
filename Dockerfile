FROM node:20-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install
RUN npm run update
RUN npm run db-push

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "npm", "run chat" ]