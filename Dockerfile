FROM docker.io/library/node:20
EXPOSE 8080

RUN <<EOF
    apt-get update &&
    apt-get install -y make g++ python3 python3-setuptools
EOF

WORKDIR /
COPY js-fastify-blog app

WORKDIR app

RUN npm install
RUN npm install -g webpack-cli
RUN npm run build

ENV NODE_ENV=production
ENTRYPOINT npm run start

