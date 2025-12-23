#!/bin/bash
: <<'COMMENT'
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Subject ...: enterSubject
Author ....: DevESP

[-] DESCRIPTION

This is a test script

The following vars are exported in the file .my-secrets

  export BASE_APP="/opt"
  export APP_NAME="myapp"
  export APP_PATH="${BASE_APP}/${APP_NAME}"

Source the file to access and use those vars in the script directly 
from the OS Environ.

Best practices for this method:

- Ensure .my-secrets is not world-readable (chmod 600 .my-secrets).
- Do not commit .my-secrets to version control (add it to .gitignore).
- Only source the secrets file when needed, and keep its location 
outside the web root or public directories if possible.

NOTE: avoid using ~/.bashrc to store secrets as discussed here.

This approach keeps secrets separate from general environment variables 
and reduces the risk of accidental exposure

[-] DEPENDENCIES
none

[-] REQUIREMENTS
none

[-] CAVEATS
none

[-] REFERENCE

-------------------------------------------------------------------------------
[-] Revision History

Date: Mon 2025Dec22 18:55:54 PST
Author: devesp
Reason for change: wrote this code

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
COMMENT

set -euo pipefail  # Exit on error, undefined vars, and pipeline errors

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Error trap handler
trap 'error_handler $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]:-})' ERR

# Error handler function
error_handler() {
    local exit_code=$1
    local line_no=$2
    local bash_lineno=$3
    local last_command=$4
    local func_trace=$5
    
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} Script failed at line $line_no with exit code: $exit_code" >&2
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} Failed command: $last_command" >&2
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} Function call stack: ${func_trace#::}" >&2
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} Bash line numbers: $bash_lineno" >&2
    exit "$exit_code"
}

# Logging functions
log_info() {
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${RED}[ERROR]${NC} $1"
}

source "./.my-secrets"

baseApp=$BASE_APP
appName=$APP_NAME
appPath=$APP_PATH 

function read_vars(){
local baseApp=$1
local appName=$2
local appPath=$3  
  echo
  log_info "Variable contents..."
  echo
  echo "Base app dir; $baseApp"
  echo "App name; $appName"
  echo "App path: $appPath"
  echo
}

# read_vars $baseApp $appName $appPath
read_vars $baseApp $appName $appPath