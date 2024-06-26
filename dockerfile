FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install

# RUN npm run build 

FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD [ "node","index.js" ]
