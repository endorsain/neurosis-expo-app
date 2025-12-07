# Usa una imagen de Node.js basada en Linux
FROM node:20-slim

# Instala pnpm globalmente dentro del contenedor
RUN npm install -g pnpm

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración
# Copiamos package.json, pnpm-lock.yaml y tsconfig.json (si existe)
COPY package.json pnpm-lock.yaml ./

# Instala las dependencias usando pnpm
# --frozen-lockfile asegura que se use el pnpm-lock.yaml de tu host
RUN pnpm install --frozen-lockfile

# Copia el resto del código
COPY . .

# Puertos para el Metro Bundler
EXPOSE 19000
EXPOSE 19001

# Comando por defecto: Deja el contenedor listo para recibir comandos exec
CMD ["/bin/bash"]