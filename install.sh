#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Python is installed
if ! command_exists python3; then
    echo -e "${YELLOW}Python 3 is not installed. Installing Python 3...${NC}"
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip
    elif command_exists yum; then
        sudo yum install -y python3 python3-pip
    elif command_exists brew; then
        brew install python
    else
        echo -e "${RED}Unable to install Python 3. Please install it manually.${NC}"
        exit 1
    fi
fi

# Check if pip is installed
if ! command_exists pip3; then
    echo -e "${YELLOW}pip3 is not installed. Installing pip3...${NC}"
    if command_exists apt-get; then
        sudo apt-get install -y python3-pip
    elif command_exists yum; then
        sudo yum install -y python3-pip
    else
        echo -e "${RED}Unable to install pip3. Please install it manually.${NC}"
        exit 1
    fi
fi

# Install required Python packages
echo -e "${GREEN}Installing required Python packages...${NC}"
pip3 install requests

echo -e "${GREEN}All requirements have been installed successfully.${NC}"

# Download the Python script
SCRIPT_NAME="Hamster_Auto_buy.py"
SCRIPT_URL="https://raw.githubusercontent.com/DYREX-FPV/Hamster-Auto-buy-BestCard/main/Hamster_Auto_buy.py"

echo -e "${GREEN}Downloading $SCRIPT_NAME...${NC}"
curl -fsSL "$SCRIPT_URL" -o "$SCRIPT_NAME"

if [ ! -f "$SCRIPT_NAME" ]; then
    echo -e "${RED}Error: Failed to download $SCRIPT_NAME${NC}"
    exit 1
fi

# Run the Python script
echo -e "${GREEN}Running the Hamster Auto Buy script...${NC}"
python3 "$SC RIPT_NAME"
