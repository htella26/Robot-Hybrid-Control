# Nonlinear 2-DOF Manipulator Control

This repository contains simulations and control implementations for a **2-DOF manipulator** operating in the **xz-plane under gravity**. The controllers are designed to achieve precise position and force tracking for various tasks, including trajectory tracking, hybrid control, force regulation, and surface adaptation.

## Features

### 🚀 Nonlinear 2-DOF Position Control
- Simulated a **2-DOF manipulator controller** in the **xz-plane under gravity**.
- Achieved **±0.05 units accuracy** in tracking a **sinusoidal endpoint trajectory** with a period of **5 seconds**.
- Utilized a **switching matrix-based position controller**.

### ⚡ Nonlinear 2-DOF Hybrid Control
- Integrated **position and force control** to achieve **precise sinusoidal motion** (±0.05 units) along a surface.
- Maintained **constant perpendicular force** (±0.1 units), ensuring **stability and adaptability**.

### 🎯 Nonlinear 2-DOF Force Control
- Designed a **force control system** to maintain a **10-unit force** on a **horizontal surface**.
- Achieved **steady-state response** within **2 oscillation cycles** using a **stiffness constant of 1000**.

### 🛠 Surface Switching Control
- Developed a **surface-adaptive controller** for **2-DOF** to handle **transitions across composite surfaces**.
- Managed a **30° inclined wedge**, ensuring **force deviations remain under 5%**.

## Installation & Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/htella26/Robot-Hybrid-Control.git
   ```
2. Install dependencies (if applicable).
3. Run simulations using MATLAB/Simulink or MATLAB Online (details in respective folders).

## Results & Visualizations

📊 Simulations demonstrate **high precision tracking, force stability, and smooth surface adaptation**, making these controllers suitable for real-world robotic applications.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

Special thanks to **Professor Christopher Kitts: https://www.scu.edu/engineering/faculty/kitts-christopher/**.
