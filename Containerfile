# Use Node 16
FROM node:16-alpine

# Set working directory
WORKDIR /home/logreaper

# Copy project files
COPY package*.json ./
COPY webpack*.config.js ./
COPY make-webpack-config.js ./
COPY config ./config
COPY app ./app
COPY lib ./lib
COPY src ./src
COPY public ./public
COPY .babelrc ./
# COPY start-dev.sh ./

# Install dependencies
RUN npm install
#RUN apk add --no-cache netcat-openbsd

# hack
COPY node_modules/babel-core/lib/transformation/file/options/option-manager.js ./node_modules/babel-core/lib/transformation/file/options/option-manager.js

# Make script executable
# RUN chmod +x start-dev.sh

# Build production bundle
RUN npm run build

# Expose ports
EXPOSE 8080

# Run shell script, not node
CMD ["npm", "run", "start-no-rh"]

