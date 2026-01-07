FROM node:20-alpine AS base
WORKDIR /app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

COPY .env .env

EXPOSE 3000

CMD ["npm", "start"]
