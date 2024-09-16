FROM python:3.10-slim-buster

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app \
    PORT=8000 \
    WEB_CONCURRENCY=2

# Install system packages required by Django.
RUN apt-get update --yes --quiet && \
    apt-get install --yes --quiet --no-install-recommends \
    # Tambahkan paket yang diperlukan jika ada
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and group
RUN addgroup --system django && \
    adduser --system --ingroup django django

# Copy requirements file and install Python packages
COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the project code
COPY . .

# Set ownership and switch to non-root user
RUN chown -R django:django /app
USER django

# Create the run script
RUN echo '#!/bin/bash\n\
PROJECT_NAME=$(find . -maxdepth 2 -type f -name "wsgi.py" | cut -d "/" -f 2)\n\
if [ -z "$PROJECT_NAME" ]; then\n\
    echo "Error: Could not find Django project."\n\
    exit 1\n\
fi\n\
echo "Django project name: ${PROJECT_NAME}"\n\
export DJANGO_SETTINGS_MODULE=${PROJECT_NAME}.settings\n\
python manage.py makemigrations\n\
python manage.py migrate\n\
python manage.py collectstatic --noinput\n\
gunicorn ${PROJECT_NAME}.wsgi:application' > /app/run.sh && \
    chmod +x /app/run.sh

# Run the application
CMD ["/app/run.sh"]