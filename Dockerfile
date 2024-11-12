

# Use a Go image to build the application
FROM golang:1.23-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code
COPY . .

RUN go mod download
# Build the application into an executable file called 'app'
RUN go build -o main .


# Expose the port that the application will listen on
EXPOSE 8080

# Command to run the application
CMD ["./main"]
