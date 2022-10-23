# Create the base image
FROM python:3.10.2

# Change the working directory
WORKDIR /app/

# Install Dependency
COPY requirements.txt /app/
RUN pip install -r ./requirements.txt

# Copy local folder into the container
COPY app.py /app/
COPY  age_prediction_model_events.pkl /app/
COPY gender_prediction_model_events.pkl /app/
COPY templates/index.html /app/templates/index.html
COPY templates/prediction.html /app/templates/prediction.html
COPY age_50devices.csv /app/
COPY gender_50devices.csv /app/

# Set "python" as the entry point
ENTRYPOINT ["python"]

# Set the command as the script name
CMD ["app.py","-m" , "flask", "run", "--host=0.0.0.0"]

#Expose the post 5000.
EXPOSE 5000