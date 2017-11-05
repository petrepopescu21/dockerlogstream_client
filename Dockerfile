FROM node:carbon

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends curl \
#     && apt-get update

# Set workdir
WORKDIR /home/site/wwwroot

RUN touch logstream_enabled
# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --only=production

# Copy rest of files
COPY . .

# Set init file to executable
RUN chmod 775 /home/site/wwwroot/init_container.sh

EXPOSE 80

ENTRYPOINT ./init_container.sh