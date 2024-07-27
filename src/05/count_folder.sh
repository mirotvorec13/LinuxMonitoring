#!/bin/bash

cd $1

echo $(( $(du | wc -l) - 1 ))
