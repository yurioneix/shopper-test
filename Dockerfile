FROM node:16-buster

WORKDIR /app
RUN apt-get update -y && apt-get install -y openssl

COPY package*.json ./
RUN npm install
RUN npx prisma init --datasource-provider mysql

COPY . .

EXPOSE 3001

# CMD ["npm", "run", "start" ]
# Comando para esperar o MySQL estar disponível antes de iniciar o servidor
CMD ["sh", "-c", "until nc -z db 3306; do echo waiting for MySQL; sleep 2; done; npm run start"]