# Use Python 3.12 slim image as the base
FROM python:3.13-slim

ENV COMPOSE_BAKE=true

# Copy the uv and uvx binaries from the official uv image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the current directory contents into the /app directory in the container
COPY . ./app

# Set the working directory to /app
WORKDIR /app

# Install dependencies using uv
# --frozen: Use exact versions from requirements.lock if present
# --no-cache: Don't use the cache when installing packages
# --no-dev: Don't install development dependencies
RUN uv sync --frozen --no-dev

# Expose port 5000 for the application
EXPOSE 5000

# Start the application using gunicorn through uv
# The --host flag is redundant as -b already specifies the binding address
CMD ["uv", "run", "gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]
