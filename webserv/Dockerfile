# Lightweight Alpine base
FROM alpine:3.22

# Install build tools + CGI interpreters
RUN apk update && apk add --no-cache \
    g++ make bash python3

# Set working directory
WORKDIR /usr/src/webserv

# Copy project files
COPY . .

# Build the Webserv binary
RUN make

# Ensure CGI scripts are executable
RUN find docs/fusion_web -type f \( -name "*.py" -o -name "*.sh" \) -exec chmod +x {} \;

# Create runtime directories
RUN mkdir -p /usr/src/webserv/docs/fusion_web/uploads \
    /usr/src/webserv/logs

# Expose ports (informational)
EXPOSE 8000-8100

# Run the server
CMD ["./webserv"]
