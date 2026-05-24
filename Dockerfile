# تغییر نسخه از alpine به slim برای حل مشکل پکیج‌های باینری تلویند
FROM node:22-slim

WORKDIR /app

COPY package.json ./

RUN npm install --no-audit --progress=false

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
