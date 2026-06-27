import os

app_name = os.getenv("APP_NAME", "World")
print(f"Hello {app_name}!")