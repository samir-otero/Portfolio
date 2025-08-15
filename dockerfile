# Use Node.js LTS Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /Otero_Samir_final_site

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (ignore peer deps conflict)
RUN npm ci --legacy-peer-deps

# Copy all project files
COPY . .

# Expose the app port
EXPOSE 5575

# Run Vite dev server, force it to port 5575
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5575"]
