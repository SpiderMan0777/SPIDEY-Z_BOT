# Use the official Python 3.10 image
FROM python:3.10

# Update and upgrade system packages
RUN apt update && apt upgrade -y

# Install git (if needed) and system dependencies (optional)
RUN apt install git -y

# Optionally, add build-essential and other dependencies if needed
# RUN apt install -y build-essential libssl-dev libffi-dev

# Copy the requirements.txt file into the image
COPY requirements.txt /requirements.txt

# Upgrade pip and install the required dependencies from requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install -r /requirements.txt

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Set the default command to run your bot
CMD ["python", "bot.py"]
