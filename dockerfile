# Intermediate docker image to build the bundle in and install dependencies
FROM node:21.7.1-alpine as build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json over in the intermedate "build" image
COPY ./package.json ./
COPY ./package-lock.json ./

# Install the dependencies
# Clean install because we want to install the exact versions
RUN npm ci

# Copy the source code into the build image
COPY ./ ./

# Build the project
RUN npm run build

# Pull the same Node image and use it as the final (production image)
FROM node:21.7.1-alpine as production

# Set the working directory to /app
WORKDIR /app

# Only copy the results from the build over to the final image
# We do this to keep the final image as small as possible
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/server ./server
COPY --from=build /app/dist ./dist

# Expose port 3000 (default port)
EXPOSE 3000

# Start the application
CMD [ "node", "server/entry.express"]
