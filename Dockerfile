FROM nginx:alpine

# Remove default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy all your static files (HTML, CSS, JS, images) into Nginx's web root
COPY . /usr/share/nginx/html

EXPOSE 80