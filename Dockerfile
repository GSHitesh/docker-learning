FROM python:3.12-slim

WORKDIR /apps

# Install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 9000

CMD ["python" ,"app.py"]