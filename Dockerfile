FROM alpine:3.21

# Install only required packages (ping for network checks, coreutils)
RUN apk add --no-cache iputils coreutils bash

# Set working directory
WORKDIR /app

# Copy the diagnostic script into the image
COPY ./app/*.sh /app/

# Set executable permissions
RUN chmod +x /app/*.sh

# Configure ENTRYPOINT to pass arguments directly to the script
ENTRYPOINT ["/app/diagnostic.sh"]

# Default command if none provided
CMD ["help"]