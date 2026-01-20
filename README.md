# HTTP Response Anomaly Detector

## Overview
The HTTP Response Anomaly Detector is a defensive security tool designed to identify **abnormally large HTTP responses** in web server access logs. Large response sizes can indicate exploitation attempts, malware delivery, or abnormal application behavior.

This project demonstrates a **blue-team incident response workflow** using simple and transparent Linux command-line techniques.

---

## Why i created this project?
During incident response, analysts often focus on HTTP status codes and request paths. However, **response size** is an equally important signal and is frequently overlooked.

Unusually large HTTP responses may indicate:
- Successful exploitation
- Malware or binary delivery
- Data exfiltration
- Abuse of vulnerable web endpoints

This tool helps analysts quickly pivot from **response size → source IP → suspicious request**.

---

## Project Structure
```
http-response-anomaly-detector/
├── scripts/
│   └── detect_response_anomalies.sh
├── sample_logs/
│   └── access.csv
├── README.md
```

---

## Requirements
- Linux or macOS
- Bash shell
- Standard Unix utilities:
  - cut
  - sort
  - grep
  - tail
- CSV-formatted web server access logs

No external libraries or dependencies are required.

---

## Setup

### Clone the Repository
```
git clone https://github.com/barrowreanna-cyber/http-response-anomaly-detector.git
cd http-response-anomaly-detector
```

### Verify Files
```
ls
```

---

## Usage

### Make the Script Executable
```
chmod +x scripts/detect_response_anomalies.sh
```

### Run the Script
```
./scripts/detect_response_anomalies.sh sample_logs/access.csv
```

---

## Example Output
```
[+] Finding largest HTTP response sizes...
33458469
7598
1309

[+] IP(s) responsible for the largest response:
220.92.153.250

[+] Suspicious request(s):
GET /card_scan_decoder.php?cmd=wget HTTP/1.1
```

---

## How to Interpret the Output

### Response Size
33458469 bytes  
An unusually large HTTP response that should be investigated.

### Source IP
220.92.153.250  
The IP address responsible for generating the anomalous response.

### Request
GET /card_scan_decoder.php?cmd=wget HTTP/1.1  
The presence of `wget` in a request strongly suggests exploitation or payload retrieval behavior.

This mirrors how a real incident responder would triage suspicious web activity.

---

## Script Logic

The script performs the following actions:

1. Validates input arguments
2. Skips the CSV header row
3. Extracts HTTP response sizes
4. Sorts them numerically
5. Identifies the largest responses
6. Maps the response back to the source IP
7. Displays the associated HTTP request

The logic intentionally relies on standard command-line tools to reflect realistic SOC workflows.

---

## Example Use Cases
- Web server compromise investigation
- Malware delivery detection
- Suspicious application behavior analysis
- Incident response triage
- Threat hunting in HTTP logs

---

## Skills Demonstrated
- Incident response methodology
- Web server log analysis
- Linux command-line proficiency
- Threat hunting mindset
- Bash scripting
- Defensive security thinking

---

## Notes
- Sample logs are sanitized and safe for public sharing
- No credentials, secrets, or sensitive data are included
- Intended for defensive and educational purposes only
-detector
