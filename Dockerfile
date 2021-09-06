ARG RASA_SDK_VERSION
# Extend the official Rasa SDK image
FROM rasa/rasa-sdk:${RASA_SDK_VERSION}

# Use subdirectory as working directory
WORKDIR /app

# Change back to root user to install dependencies
USER root

COPY requirements.txt .

# To install packages from PyPI
RUN pip install --no-cache-dir -r requirements.txt

# Copy actions folder to working directory
COPY ./actions /app/actions

# Switch back to non-root to run code
USER 1001