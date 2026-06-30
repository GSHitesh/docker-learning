FROM python:3.12-slim

WORKDIR /app

ENV APP_NAME=Hitesh
ENV PORT=9000

# Install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 9000

ENTRYPOINT ["python" ,"app.py"]

CMD ["--port","8000"]
#docker build -t myapp:1.0. <name>:<version> is the format for tagging the image. The dot (.) at the end specifies the build context, which is the current directory in this case.
#The flags should be mentioned before the image name. The -t flag is used to tag the image with a name and version. In this case, we are tagging the image as myapp:1.0.
#docker run --rm --name myapp -e APP_NAME=WORLD myapp:1.3