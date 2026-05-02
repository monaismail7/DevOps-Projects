# 📦 Log Archive Tool

## 📌 Overview
This is a simple Bash CLI tool that archives log files from a given directory by compressing them into a `.tar.gz` file.  
It helps keep the system clean while preserving logs for future reference.

---

## ⚙️ Features
- Accepts log directory as input
- Compresses logs into a `.tar.gz` file
- Stores archives in a dedicated folder (`~/log_archives`)
- Logs each operation with timestamp
- Simple and lightweight Bash script

---

## 🚀 Usage

```bash
./log-archive.sh /var/log
