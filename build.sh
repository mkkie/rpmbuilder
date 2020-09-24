#!/bin/bash
docker build --target base -t rpmbuilder-base .
docker build --target builder -t rpmbuilder .
