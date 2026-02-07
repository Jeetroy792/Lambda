FROM python:3.12-slim

# প্রয়োজনীয় সিস্টেম ডিপেন্ডেন্সি ইনস্টল করা
RUN apt update && apt install -y \
    git gcc python3-dev libffi-dev build-essential \
    && apt upgrade -y

# কাজের ডিরেক্টরি সেট করা
RUN mkdir /fwdbot
WORKDIR /fwdbot

# রিপোজিটরির সব ফাইল কন্টেইনারে কপি করা (সবচেয়ে গুরুত্বপূর্ণ)
COPY . .

# ডিপেন্ডেন্সি ইনস্টল করা
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# চালনার অনুমতি দেওয়া
RUN chmod +x start.sh

# বট চালু করার কমান্ড
CMD ["/bin/bash", "start.sh"]
