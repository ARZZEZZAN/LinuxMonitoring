#!/bin/bash

parameter="$1"

if [[ "$parameter" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a text value."
else
    echo "The parameter value is: $parameter"
fi