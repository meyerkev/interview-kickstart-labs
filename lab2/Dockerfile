FROM python:latest
COPY requirements.txt .
RUN pip3 install -r requirements.txt && rm requirements.txt
COPY server.py /
RUN chmod +x /server.py
EXPOSE 8080
CMD ["python3", "server.py"]
