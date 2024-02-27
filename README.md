# Inventory Management App

This Flutter app allows users to manage inventory items, register new users, and update item stock levels in real time.

## Features

- User Authentication: Users can register and log in with email and password using Firebase Authentication.
- Inventory Management: Users can update stock levels for each item in the inventory.
- Real-time Updates: Changes to item stock levels are instantly reflected on the respective vendor's devices.

## Explanation Video
   ```sh
   https://drive.google.com/file/d/1Xjf2VRpubIl66LbBar2n5jl25u3eNepf/view
   ```

## Codebase Breakdown for the lib folder

1. **models:** Contains enum data types (`ItemStock`, `VendorType`) used in the application.

2. **repositories:** Functions for database communication (authentication, stock value fetching/updating).

3. **stationery:** Files for the store side (screens, logic for managing inventory items).

4. **utils:** Utility functions and widgets for reducing repetitive code.

5. **vendor:** Files for the vendor side (screens, logic for managing inventory and stock levels).

6. **landing_screen:** First screen of the application, serving as the entry point.

7. **register_user_screen:** Screen for new user registration.


## Installation
To get a local copy up and running, follow these steps.

1. Clone the repo
   ```sh
   git clone https://github.com/Shubhamsahu1101/InventoryManagementApp
2. Get the dependencies
   ```sh
   flutter pub get
3. Run
   ```sh
   flutter run

## Usage

1. Register a new user or login with an existing account.
2. Add items to the inventory with stock levels (low, medium, high).
3. Update stock levels and see changes reflected in real-time on other devices.

