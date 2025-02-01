# Use an official Python 3.11 runtime as the base image.
FROM python:3.11-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the repository contents into the container.
COPY . .

# Upgrade pip and install the package in editable mode.
RUN pip install --upgrade pip && \
    pip install -e .

# Install additional dependencies: Gradio and Playwright,
# then download the necessary browser binaries.
RUN pip install gradio playwright && \
    playwright install

# Expose port 8080 (required for Cloud Run or similar platforms).
EXPOSE 8080
ENV PORT=8080

# Set the entrypoint to run the Gradio demo (adjust if needed).
CMD ["python", "examples/ui/gradio_demo.py"]
