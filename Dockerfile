FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# Copy the project into the container
COPY . /app

# Upgrade pip and install dependencies from requirements.txt
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Set the entrypoint to run Robot Framework tests
ENTRYPOINT ["robot"]