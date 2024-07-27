#!/bin/bash

cd $1

echo $(find . -type f | wc -l)
