set -e

SCRIPT_VERSION="v1.0"

# exit with error status code if user is not root
if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi

# check for curl
if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

output() {
  echo -e "* ${1}"
}

error() {
  COLOR_RED='\033[0;31m'
  COLOR_NC='\033[0m'

  echo ""
  echo -e "* ${COLOR_RED}ERROR${COLOR_NC}: $1"
  echo ""
}

output "Minecraft Installation Script | $SCRIPT_VERSION"
output
output "by How2Minecraft"
output "https://www.youtube.com/channel/UCZSZBeR-JM2u8nFhcuvMPjA"
output
output "Subscribe to How2Minecraft on YouTube!"
output

java() {
  bash <(curl -s https://raw.githubusercontent.com/DumbCaveSpider/Minecraft-Linux-Installation/main/java.sh)
}

output "Starting Java installation..."
java
