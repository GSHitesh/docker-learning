import os

app_name = os.getenv("APP_NAME", "World")
print(f"Hello {app_name}!")

print("This is a simple Python application.")

print("You can set the APP_NAME environment variable to change the greeting.")