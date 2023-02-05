```
docker build https://github.com/Hanoi-NLP/opus-mt-en-vi.git#main
```
<h1>Installation and Usage</h1>

<h2>Prerequisites</h2>

<ul>
  <li>Docker: Download and install Docker on your system. You can find instructions for your operating system <a href="https://docs.docker.com/engine/install/">here</a>.</li>
</ul>

<h2>Steps</h2>

<ol>
  <li>Clone this repository:
  <pre>
  git clone https://github.com/your-repository-url.git
  </pre>
  </li>
  <li>Navigate to the repository directory:
  <pre>
  cd your-repository-directory
  </pre>
  </li>
  <li>Build the Docker image:
  <pre>
  docker build -t your-image-name .
  </pre>
  </li>
  <li>Run the Docker container:
  <pre>
  docker run -p 8000:8000 your-image-name
  </pre>
  </li>
  <li>Access the web UI in your web browser:
  Go to <code>http://localhost:8000</code> in your web browser.
  </li>
</ol>

<h2>Tips</h2>
<ul>
  <li>To stop the Docker container, press <code>CTRL + C</code> in the terminal window where the container is running.</li>
  <li>To remove the Docker container, run <code>docker rm your-container-id</code>. You can find the container ID by running <code>docker ps</code>.</li>
  <li>To remove the Docker image, run <code>docker rmi your-image-name</code>.</li>
</ul>

<h1>Deployment</h1>

<h2>AWS Elastic Container Service (ECS)</h2>

<ol>
  <li><a href="https://docs.aws.amazon.com/en_us/AmazonECR/latest/userguide/repository-create.html">Create an Amazon ECR repository</a> to store the Docker image.</li>
  <li>Tag the Docker image with the repository URI:
  <pre>
  docker tag your-image-name:latest repository-uri/your-image-name:latest
  </pre>
  </li>
  <li>Push the Docker image to Amazon ECR:
  <pre>
  docker push repository-uri/your-image-name:latest
  </pre>
  </li>
  <li><a href="https://docs.aws.amazon.com/en_us/AmazonECS/latest/developerguide/task_definitions.html">Create an Amazon ECS task definition</a> for your application.</li>
  <li><a href="https://docs.aws.amazon.com/en_us/AmazonECS/latest/developerguide/ecs_services.html">Create an Amazon ECS service</a> to run and maintain a specified number of tasks of your task definition.</li>
  <li>Access the web UI using the service endpoint.</li>
</ol>
