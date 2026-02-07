FROM python:3.12-slim

RUN apt update && apt install -y \
    git gcc python3-dev libffi-dev build-essential \
    && apt upgrade -y

RUN mkdir /fwdbot
WORKDIR /fwdbot

# রিপোজিটরির সব ফাইল কপি করার কমান্ড
COPY . .

RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

RUN chmod +x start.sh

CMD ["/bin/bash", "start.sh"]
