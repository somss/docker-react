FROM node:16-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN yarn build

FROM nginx
COPY --from=0 /app/build usr/share/nginx/html
