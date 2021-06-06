Cloud Kickstarter
===================


# Build

## Build For GCP

```bash
docker build --target cloudstarter-gcp -t cloudstarter-gcp:latest .
```

## Build For Azure

```bash
docker build --target cloudstarter-azure -t cloudstarter-azure:latest .
```

# Run

## Run For GCP

```bash
docker run -ti cloudstarter-gcp:latest
```

## Run For Azure

```bash
docker run -ti cloudstarter-azure:latest
```

# Troubleshooting

## Unexisting bucket doesn't exist

### Symptom

```Error: Failed to get existing workspaces: querying Cloud Storage failed: googleapi: Error 403: .... does not have storage.objects.list access to the Google Cloud Storage bucket., forbidden```

### Solution

Make sure that bucket mentioned in backend configuration exists and your account has read/write permissions


