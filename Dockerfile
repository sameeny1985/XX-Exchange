FROM python:3.10-slim

# ایجاد پوشه برنامه در سرور
WORKDIR /app

# کپی کردن فایل لیست پکیج‌ها (اگر وجود دارد)
COPY requirements.txt .

# نصب پکیج‌های مورد نیاز (اگر فایلی نبود این خط نادیده گرفته می‌شود)
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# کپی کردن تمام فایل‌های پروژه به سرور
COPY . .

# پورتی که برنامه روی آن گوش می‌دهد (کویب به صورت پیش‌فرض روی 8000 تنظیم است)
EXPOSE 8000

# دستور اجرای برنامه شما
# توجه: نام فایل اصلی خود را جایگزین main.py کنید (مثلاً app.py)
CMD ["python", "main.py"]
