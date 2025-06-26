# syntax=docker/dockerfile:1
FROM node:20-alpine AS base
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine AS production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=base /usr/src/app/dist ./dist
COPY --from=base /usr/src/app/server ./server
COPY --from=base /usr/src/app/config.cjs ./config.cjs
COPY --from=base /usr/src/app/views ./views
EXPOSE 8080
ENV NODE_ENV=production
CMD ["npm", "start"]
