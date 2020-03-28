#!/bin/bash
echo 'Actualizando el sistema'
sudo apt update
sudo apt upgrade -y
echo 'Actualizando npm'
sudo npm update -g 

