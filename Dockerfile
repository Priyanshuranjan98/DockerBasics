FROM node:alpine as nodeimage
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx as serveriamge
EXPOSE 80
COPY --from=nodeimage /var/app/build /usr/share/nginx/html