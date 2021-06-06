#!/bin/bash

docker build --no-cache . 
docker build --target cloudstarter-gcp -t cloudstarter-gcp:latest .
docker build --target cloudstarter-azure -t cloudstarter-azure:latest .