FROM node:14.20.0-alpine as build

WORKDIR /app




COPY package*.json ./


# Install Angular CLI
RUN npm install -g @angular/cli@16.2.6

RUN npm install

COPY . .

RUN npm run build

### STAGE 2: Run ###
FROM nginx:alpine



#### copy artifact build from the 'build environment'
COPY --from=build /app/dist/angular-ecommerce /usr/share/nginx/html

EXPOSE 80

CMD["nginx", "-g","daemon off;"]]
