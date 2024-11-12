

# Use a Go image to build the application
FROM golang:1.21-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Download dependencies
RUN go mod tidy

# Copy the application source code
COPY . .

# Build the application into an executable file called 'app'
RUN go build -o app .

# Use a minimal image for the runtime phase
FROM alpine:latest

# Copy the compiled binary from the build phase
COPY --from=builder /app/app .

# Expose the port that the application will listen on
EXPOSE 8080

# Command to run the application
CMD ["./app"]
