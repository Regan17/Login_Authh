# FROM python:3.11

# # Set environment variables
# # Set the working directory in the container
# WORKDIR /app

# # Copy the current directory contents into the container at /app
# COPY . /app

# # Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose port 8000 for the Django development server
# EXPOSE 8000

# # Run the application
# CMD ["python", "manage.py", "runserver"]
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose port 8000 for the Django development server
EXPOSE 8000

# Collect static files
RUN python manage.py collectstatic --noinput

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]