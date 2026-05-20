# Etapa 1: Construcción
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Servidor Web con Nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Copiar la plantilla a la carpeta de Nginx
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]