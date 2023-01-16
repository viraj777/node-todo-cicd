FROM node
WORKDIR app
ADD . /app
RUN npm install
EXPOSE 8000
ENTRYPOINT ["node","app.js"]

