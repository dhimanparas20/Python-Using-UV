# Use the latest available Python 3.12 slim image (3.13 may not be available yet)
FROM python:3.13-slim

ENV COMPOSE_BAKE=true \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Copy the uv and uvx binaries from the official uv image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set work directory
WORKDIR /app

# Copy only dependency files first for better Docker cache utilization
COPY pyproject.toml requirements.txt* ./

# Install dependencies using uv
RUN uv sync --frozen --no-dev

# Now copy the rest of the application code
COPY . .

# Create a non-root user and switch to it for security
RUN adduser --disabled-password --gecos '' appuser && chown -R appuser /app
USER appuser

# Expose port 5000 for the application
EXPOSE 5000

# Start the application using gunicorn through uv
CMD ["uv", "run", "gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]
