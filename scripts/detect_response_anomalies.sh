#!/bin/bash

# Check for correct usage
if [ $# -ne 1 ]; then
  echo "Usage: $0 <access_log.csv>"
  exit 1
fi

LOGFILE=$1

if [ ! -f "$LOGFILE" ]; then
  echo "Error: File not found -> $LOGFILE"
  exit 1
fi

echo "[+] Finding largest HTTP response sizes..."
tail -n +2 "$LOGFILE" | cut -d',' -f4 | sort -rn | head -5

echo
echo "[+] IP(s) responsible for the largest response:"
LARGEST=$(tail -n +2 "$LOGFILE" | cut -d',' -f4 | sort -rn | head -1)
tail -n +2 "$LOGFILE" | grep ",$LARGEST," | cut -d',' -f1 | sort -u

echo
echo "[+] Suspicious request(s):"
tail -n +2 "$LOGFILE" | grep ",$LARGEST," | cut -d',' -f3

