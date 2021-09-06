# Extend the official Rasa SDK image
FROM rasa/rasa-sdk:2.8.2

# Use subdirectory as working directory
WORKDIR /app

# Change back to root user to install dependencies
USER root

# To install packages from PyPI
RUN pip install rasa==2.8.4

# Copy actions folder to working directory
COPY ./actions /app/actions

# Switch back to non-root to run code
USER 1001

RUN rasa run actions