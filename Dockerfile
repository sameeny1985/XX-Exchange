FROM node:18-alpine

WORKDIR /app

# کپی کردن فایل کانفیگ پکیج‌ها
COPY package.json ./

# نصب پکیج‌ها بدون توجه به فایل قفل و محدودیت‌ها
RUN npm install --no-audit --progress=false

# کپی کردن بقیه فایل‌های پروژه
COPY . .

# بیلد کردن پروژه نهایی Next.js
RUN npm run build

EXPOSE 3000

# دستور اجرای برنامه
CMD ["npm", "start"]
