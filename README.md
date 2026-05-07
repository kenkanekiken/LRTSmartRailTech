#Autonomous LRT Mileage Tracking System 🚆

An embedded systems project designed to develop an autonomous mileage tracking solution for SMRT LRT trains using ESP32 microcontrollers and CAN Bus / TCMS integration.

The system aims to automatically monitor and record train mileage data in real time for maintenance tracking, fleet monitoring, and predictive servicing purposes.

⸻

📌 Project Overview

Traditional railway mileage tracking may rely on internal train systems and proprietary industrial hardware.
This project explores a low-cost embedded solution capable of interfacing with railway communication systems such as:

* CAN Bus
* TCMS (Train Control & Monitoring System)
* Electronic speed and distance signals

The project investigates how train telemetry data can be collected, processed, and logged autonomously using IoT and embedded technologies.

⸻

⚡ Features

* Real-time mileage tracking
* ESP32-based embedded controller
* CAN Bus communication support
* TCMS data integration concept
* Distance accumulation logic
* Speed-to-distance calculations
* Wireless telemetry capability
* Modular and scalable architecture
* Industrial IoT railway application

⸻

🛠 Hardware Used

* ESP32 / ESP32 T-Beam
* MCP2515 CAN Bus Module
* CAN Transceiver (TJA1050)
* Breadboard / Prototype PCB
* Power supply module

🔌 System Architecture
LRT TCMS / CAN Network
            │
            ▼
   MCP2515 CAN Module
            │
            ▼
         ESP32
            │
   ┌────────┴────────┐
   ▼                 ▼
Mileage Logic     Telemetry
Processing         / Logging


📡 CAN Bus Integration

The project studies industrial railway communication through:

* CAN frame monitoring
* Speed signal decoding
* Electronic odometer data
* Distance calculation from speed packets
* TCMS communication concepts

⸻

📊 Mileage Calculation Concept

Distance can be calculated using speed data over time:

d = v \times t

Where:

* d = distance travelled
* v = speed
* t = elapsed time

The ESP32 continuously accumulates total mileage from incoming telemetry data.

⸻

🎯 Project Goals

* Develop a prototype autonomous mileage tracker
* Explore industrial railway communication systems
* Learn CAN Bus packet communication
* Simulate TCMS integration
* Build a scalable railway IoT platform

⸻

🚧 Current Status

* Project planning
* CAN Bus architecture research
* ESP32 CAN communication testing
* Mileage accumulation algorithm
* CAN frame decoding
* Data logging implementation
* Real-world integration testing

⸻

📚 Technologies

* Embedded C / Arduino
* ESP32
* CAN Bus
* IoT Systems
* Railway Automation Concepts
* Industrial Communication
