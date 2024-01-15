# ARTY A7 I2C MPU-6050

This project focuses on the seamless integration of the MPU-6050 Inertial Measurement Unit (IMU) utilizing the I2C (Inter-Integrated Circuit) protocol into the Arty A7-100T FPGA platform. The MPU-6050, equipped with a gyroscope, accelerometer, and temperature sensor, provides comprehensive motion sensing capabilities.

### Implementation

The integration involves establishing a robust I2C communication interface between the FPGA and the MPU-6050 sensor. The FPGA, acting as the master device, initiates communication with the MPU-6050 to receive real-time gyroscope data. This data is then processed within the FPGA environment, enabling applications such as orientation tracking, motion analysis, or any other relevant functionality.

## References

- [Gyroscope Working](https://lastminuteengineers.com/mpu6050-accel-gyro-arduino-tutorial/)
- [Gyro Sensor MPU-6050 Datasheet](https://invensense.tdk.com/wp-content/uploads/2015/02/MPU-6000-Datasheet1.pdf)
- [Gyro Sensor MPU-6050 Register Mapping](https://cdn.sparkfun.com/datasheets/Sensors/Accelerometers/RM-MPU-6000A.pdf)
- [Artix-7 100T CSG234 Constraints](https://github.com/Digilent/digilent-xdc/blob/master/Arty-A7-100-Master.xdc)
