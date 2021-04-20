#!/bin/bash

echo "Starting calendso"

# Use primsa scheme
npx prisma db push --preview-feature

# Create the user
node ./createUser.js

# Run App
yarn dev
