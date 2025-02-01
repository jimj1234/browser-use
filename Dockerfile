# Use an official Python runtime as the base image.
FROM python:3.9-slim

# Set the working directory in the container.
WORKDIR /app

# Copy over the project files.
# (Assumes your Dockerfile is at the root of your repository.)
COPY . .

# Upgrade pip and install your package in editable mode.
RUN pip install --upgrade pip && \
    pip install -e .

# Install additional dependencies for the demo.
# This installs Gradio (used in the demo) and Playwright.
RUN pip install gradio playwright && \
    playwright install

# Cloud Run (or your hosting service) expects the container to listen on port 8080.
EXPOSE 8080
ENV PORT=8080

# Set the entrypoint to run the Gradio demo.
CMD ["python", "examples/ui/gradio_demo.py"]
