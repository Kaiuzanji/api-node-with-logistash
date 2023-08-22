# Use uma imagem Node.js como base
FROM node:18

# Crie o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie o package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante dos arquivos da aplicação para o diretório de trabalho
COPY . .

# Compile o TypeScript para JavaScript
RUN npm run build

# Exponha a porta em que a aplicação ouve
EXPOSE 3000

# Comando para iniciar a aplicação
CMD [ "node", "./dist/server.js" ]
