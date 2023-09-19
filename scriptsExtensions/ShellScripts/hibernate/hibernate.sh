#!/bin/bash

echo "Enter minutes until sleep"
read minutes

sleep "$((minutes * 60))"

systemctl suspend
