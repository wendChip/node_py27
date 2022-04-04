# FROM 14.19.1 with alpine (I think you meant 14.19 instead of 14.9?)
FROM node:14.19.1-alpine3.15

# An overly cautious Alpine apk update with what packages I 'think' you might want
RUN apk update && apk add python2 g++ make bash

# Adding a group and user to run app with (can be omitted if you want to use superuser)
RUN addgroup app && adduser -S -G app app

# Making directory inside container
RUN mkdir -p /app
# Chowning it (otherwise it will fail w/perms--I'm sure there's a better way to do this)
RUN chown app:app /app

# Switching to user then /app
USER app
WORKDIR /app

# Obvi
COPY package*.json .

# Whatever is preferred -- install or ci
RUN npm install

# Copy everything from current dir to /app
COPY . .

# Don't know if you're running the app immediately but exposing a host port
EXPOSE 3000

# This is where you'd run your app or simply do "bash"
# CMD is more flexible than ENTRYPOINT, but feel free to use it
# Yours would be more ["npm run"]?
CMD ["node", "src/index.js"]
